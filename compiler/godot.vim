" Compiler:	godot

if exists("current_compiler")
  finish
endif
let current_compiler = "godot"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet errorformat=

" Ignore cpp lines.
CompilerSet errorformat+=%-G%\\s%#at:%.%#\ \(%.%#.cpp:%\\d%\\+)

" Match filenames including res:// which works because of godot#edit_res_path.

CompilerSet errorformat+=%tRROR:\ Failed\ to\ load\ script\ \"%f\"\ with\ error\ \"%m\".
CompilerSet errorformat+=%tRROR:\ %.%#\\,\ script\ \'%f\'%m

" These parse errors have the file on another line.
CompilerSet errorformat+=%ESCRIPT\ ERROR:\ %m
CompilerSet errorformat+=%-C%\\s%#at:\ %s\ (%f:%l)

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2:

