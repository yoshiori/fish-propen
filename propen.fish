function propen --argument-names "remote"
  if not test -n "$remote"
    set remote origin
  end
  set -l branch (git symbolic-ref --short HEAD | xargs perl -MURI::Escape -e 'print uri_escape($ARGV[0]);')
  set -l url (git config --get remote.$remote.url | sed -e "s/.*git@\(.*\).git/\1/" | sed -e "s/:/\//")
  open https://$url/pull/$branch
end
