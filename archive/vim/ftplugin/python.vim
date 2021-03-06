map! <buffer> <F5> <Esc>:w<CR>:!./% <CR>
map <buffer> <F5> <Esc>:w<CR>:!./% <CR>

au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-Space>"
set completeopt=menuone,longest,preview

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" macros
" comment line
let @c='^i#�kd�kl'
" uncomment line
let @u='^�kdi#�kd�kl'

" enforce 80 character line len
match OverLength /\%81v.\+/
let g:syntastic_python_checkers = ['python']

