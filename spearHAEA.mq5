//+------------------------------------------------------------------+
//|                 HeikenAshiBladeBot_v11.mq5                       |
//+------------------------------------------------------------------+
#property strict

// Ustawienia
input string  InpSymbol       = "";       // Pusty = symbol wykresu, inaczej np. "EURUSD"
input double  LotSize         = 0.10;     // Wielkość pozycji
input double  PriceDifference = 100;      // Minimalna różnica cenowa (w punktach)
input double  TimeWindowHours = 2.25;     // Przedział czasowy między pierwszą a trzecią świecą
input int     Slippage        = 10;       // Dopuszczalny poślizg
input int     StopLossPoints  = 150;      // Stop Loss w punktach (0 = bez SL)
input bool    DebugLog        = true;     // Logi diagnostyczne
input bool    UseHeikenAshi   = true;     // true -> HA, false -> zwykłe świecy

// Stan globalny
string   gSymbol            = NULL;
datetime gLastActionBarTime = 0;
int      gLastActionDir     = 0; // +1 BUY, -1 SELL, 0 none

// Struktura HA świecy
struct HA_Candle
{
   double   open;
   double   close;
   double   high;
   double   low;
   bool     isBull;
   datetime time;
};

//--- Prototypy
HA_Candle ComputeHA(double o,double h,double l,double c,double prevHAOpen,double prevHAClose,datetime tm);
bool      TimeCheck(datetime tStart, datetime tEnd);
void      OpenPosition(int type);
void      CloseAllPositionsForSymbol();

//+------------------------------------------------------------------+
//| Inicjalizacja                                                    |
//+------------------------------------------------------------------+
int OnInit()
{
   gSymbol = (InpSymbol == "" ? _Symbol : InpSymbol);
   if(!SymbolSelect(gSymbol,true))
   {
      Print("Błąd: nie mogę wybrać symbolu ", gSymbol);
      return(INIT_FAILED);
   }
   Print("HeikenAshiBladeBot v11 uruchomiony dla symbolu ", gSymbol);
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Główny tick                                                      |
//+------------------------------------------------------------------+
void OnTick()
{
   // if(DebugLog) Print("OnTick called.");

   double o[3], h[3], l[3], c[3];
   datetime t[3];
   ArraySetAsSeries(o,true); ArraySetAsSeries(h,true); ArraySetAsSeries(l,true); ArraySetAsSeries(c,true); ArraySetAsSeries(t,true);

   if(CopyOpen (gSymbol, PERIOD_H1, 0, 3, o) != 3) { if(DebugLog) Print("Exit: CopyOpen failed."); return; }
   if(CopyHigh (gSymbol, PERIOD_H1, 0, 3, h) != 3) { if(DebugLog) Print("Exit: CopyHigh failed."); return; }
   if(CopyLow  (gSymbol, PERIOD_H1, 0, 3, l) != 3) { if(DebugLog) Print("Exit: CopyLow failed."); return; }
   if(CopyClose(gSymbol, PERIOD_H1, 0, 3, c) != 3) { if(DebugLog) Print("Exit: CopyClose failed."); return; }
   if(CopyTime (gSymbol, PERIOD_H1, 0, 3, t) != 3) { if(DebugLog) Print("Exit: CopyTime failed."); return; }
   //if(DebugLog) Print("Data copy OK.");

   HA_Candle ha0, ha1, ha2; // 0 = bieżąca, 1 = środkowa, 2 = pierwsza/historyczna

   if(UseHeikenAshi)
   {
      ha2 = ComputeHA(o[2],h[2],l[2],c[2],0,0,t[2]);
      ha1 = ComputeHA(o[1],h[1],l[1],c[1],ha2.open,ha2.close,t[1]);
      ha0 = ComputeHA(o[0],h[0],l[0],c[0],ha1.open,ha1.close,t[0]);
   }
   else
   {
      // zwykłe świece
      ha2.open  = o[2]; ha2.high  = h[2]; ha2.low  = l[2]; ha2.close  = c[2]; ha2.isBull = (c[2]>=o[2]); ha2.time=t[2];
      ha1.open  = o[1]; ha1.high  = h[1]; ha1.low  = l[1]; ha1.close  = c[1]; ha1.isBull = (c[1]>=o[1]); ha1.time=t[1];
      ha0.open  = o[0]; ha0.high  = h[0]; ha0.low  = l[0]; ha0.close  = c[0]; ha0.isBull = (c[0]>=o[0]); ha0.time=t[0];
   }

   //if(!TimeCheck(ha2.time,ha0.time)) { if(DebugLog) Print("Exit: TimeCheck failed."); return; }

   if(ha0.time==gLastActionBarTime) return; // anty-dubler

   double pt = SymbolInfoDouble(gSymbol,SYMBOL_POINT);
   double diff = PriceDifference*pt;

   // Wyznacz ceny dla porównania ostrza (logika hybrydowa)
   double leftPrice    = ha2.close; // Zamknięcie - punkt historyczny jest już znany
   double middlePrice  = ha1.close; // Zamknięcie - szczyt/dno ostrza na wykresie liniowym
   double rightHigh    = ha0.high;  // High bieżącej świecy - do wczesnego wykrywania
   double rightLow     = ha0.low;   // Low bieżącej świecy - do wczesnego wykrywania

   // ==================================================================
   // POCZĄTEK BLOKU DIAGNOSTYCZNEGO
   // ==================================================================
   // if(DebugLog)
   // {
   //    string debug_msg = StringFormat("Tick Check | middle_C:%.5f, left_C:%.5f, right_H:%.5f, right_L:%.5f, diff:%.5f",
   //                                    middlePrice, leftPrice, rightHigh, rightLow, diff);
   //    Print(debug_msg);
   // }
   // ==================================================================
   // KONIEC BLOKU DIAGNOSTYCZNEGO
   // ==================================================================

   // Ostrze w górę (sygnał SPRZEDAŻY, formacja ^)
   // Porównujemy szczyt (middle.close) do lewej (past.close) i prawej (current.high)
   bool spikeUp = (middlePrice >= leftPrice + diff) && (middlePrice >= rightHigh + diff);
   if(spikeUp)
   {
      if(DebugLog) Print("Sygnał BEAR (ostrze w górę) wykryty - logika hybrydowa.");
      CloseAllPositionsForSymbol();
      OpenPosition(ORDER_TYPE_SELL);
      gLastActionBarTime = ha0.time;
      gLastActionDir     = -1;
      return;
   }

   // Ostrze w dół (sygnał KUPNA, formacja V)
   // Porównujemy dno (middle.close) do lewej (past.close) i prawej (current.low)
   bool spikeDown = (middlePrice <= leftPrice - diff) && (middlePrice <= rightLow - diff);
   if(spikeDown)
   {
      if(DebugLog) Print("Sygnał BULL (ostrze w dół) wykryty - logika hybrydowa.");
      CloseAllPositionsForSymbol();
      OpenPosition(ORDER_TYPE_BUY);
      gLastActionBarTime = ha0.time;
      gLastActionDir     = +1;
      return;
   }
}

//+------------------------------------------------------------------+
//| Heiken Ashi                                                      |
//+------------------------------------------------------------------+
HA_Candle ComputeHA(double o,double h,double l,double c,double prevHAOpen,double prevHAClose,datetime tm)
{
   HA_Candle ha;
   ha.close = (o+h+l+c)/4.0;
   if(prevHAOpen==0 && prevHAClose==0) ha.open=(o+c)/2.0;
   else ha.open = (prevHAOpen+prevHAClose)/2.0;
   ha.high = MathMax(MathMax(h,ha.open),ha.close);
   ha.low  = MathMin(MathMin(l,ha.open),ha.close);
   ha.isBull = (ha.close>=ha.open);
   ha.time = tm;
   return ha;
}

//+------------------------------------------------------------------+
//| Sprawdzenie przedziału czasowego                                 |
//+------------------------------------------------------------------+
bool TimeCheck(datetime tStart, datetime tEnd)
{
   double hoursDiff = MathAbs((double)(tEnd - tStart))/3600.0;
   
   // --- Final Debug Block ---
   //if(DebugLog)
   //{
    //  string msg = StringFormat("Inside TimeCheck: tStart=%s, tEnd=%s, hoursDiff=%.2f. Condition: %.2f >= 1.5 && %.2f <= %.2f",
     //                           TimeToString(tStart), TimeToString(tEnd), hoursDiff,
      //                          hoursDiff, hoursDiff, TimeWindowHours);
     // Print(msg);
  // }
   // --- End Debug Block ---

   return (hoursDiff >= 1.5 && hoursDiff <= TimeWindowHours);
}

//+------------------------------------------------------------------+
//| Otwieranie pozycji                                               |
//+------------------------------------------------------------------+
void OpenPosition(int type)
{
   MqlTradeRequest req;
   MqlTradeResult  res;
   ZeroMemory(req);
   ZeroMemory(res);

   req.action    = TRADE_ACTION_DEAL;
   req.symbol    = gSymbol;
   req.volume    = LotSize;
   req.type      = type;
   req.price     = (type==ORDER_TYPE_BUY)?SymbolInfoDouble(gSymbol,SYMBOL_ASK)
                                        :SymbolInfoDouble(gSymbol,SYMBOL_BID);
   req.deviation = Slippage;
   req.magic     = 123456;
   req.comment   = "HeikenAshiBladeBot_v11";

   // Dodanie Stop Loss
   if(StopLossPoints > 0)
   {
      double point = SymbolInfoDouble(gSymbol, SYMBOL_POINT);
      int digits = (int)SymbolInfoInteger(gSymbol, SYMBOL_DIGITS);
      double sl_price = 0;

      if(type == ORDER_TYPE_BUY)
         sl_price = req.price - StopLossPoints * point;
      else // ORDER_TYPE_SELL
         sl_price = req.price + StopLossPoints * point;
      
      req.sl = NormalizeDouble(sl_price, digits);
   }

   if(!OrderSend(req,res))
      Print("Błąd otwarcia pozycji: retcode=",res.retcode);
   else
      Print("Otwarta pozycja: ",(type==ORDER_TYPE_BUY?"BUY":"SELL")," ticket=",res.order);
}

//+------------------------------------------------------------------+
//| Zamykanie wszystkich pozycji dla symbolu                         |
//+------------------------------------------------------------------+
void CloseAllPositionsForSymbol()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket == 0) continue;

      // Select position to get its properties
      if(!PositionSelectByTicket(ticket)) continue;

      if(PositionGetString(POSITION_SYMBOL) != gSymbol) continue;

      // Create trade request
      MqlTradeRequest request;
      MqlTradeResult  result;
      ZeroMemory(request);
      ZeroMemory(result);

      request.action   = TRADE_ACTION_DEAL;
      request.symbol   = PositionGetString(POSITION_SYMBOL);
      request.volume   = PositionGetDouble(POSITION_VOLUME);
      request.type     = (PositionGetInteger(POSITION_TYPE) == ORDER_TYPE_BUY) ? ORDER_TYPE_SELL : ORDER_TYPE_BUY;
      request.position = ticket; // Specify the position to close
      request.price    = (request.type == ORDER_TYPE_BUY) ? SymbolInfoDouble(request.symbol, SYMBOL_ASK) : SymbolInfoDouble(request.symbol, SYMBOL_BID);
      request.deviation = Slippage;
      request.magic    = (int)PositionGetInteger(POSITION_MAGIC);
      request.comment  = "CloseAll_v12";

      if(!OrderSend(request, result))
      {
         PrintFormat("Błąd zamknięcia pozycji #%d: %d", ticket, result.retcode);
      }
      else
      {
         PrintFormat("Zamknięto pozycję #%d.", ticket);
      }
   }
}
