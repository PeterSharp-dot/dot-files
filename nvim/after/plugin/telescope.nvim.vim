lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"tags"} } }
-- require('telescope').load_extension('fzf')
EOF
