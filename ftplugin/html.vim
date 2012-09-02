" This is a wrapper script to add extra html support to xml documents.

" Only do this when not done yet for this buffer
if exists( "b:did_ftplugin" )
  finish
endif
" Don't set 'b:did_ftplugin = 1' because that is xml.vim's responsibility.

let b:html_mode = 1

function HtmlAttribCallback( xml_tag )
  if a:xml_tag ==? "img"
    return 'src="" width="0" height="0" alt=""''
  elseif a:xml_tag ==? "link"
    return 'href="/site.css" rel="stylesheet"'
  elseif a:xml_tag ==? "a"
    return 'href=""'
  elseif a:xml_tag ==? "meta"
    return 'name="" content=""'
  else
    return 0
  endif
endfunction

" On to loading xml.vim
runtime ftplugin/xml.vim
