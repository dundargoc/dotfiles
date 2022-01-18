function compl-length
  argparse '#maxlength' -- $argv

  if set -q _flag_maxlength
    set maxlength $_flag_maxlength
  else
    set maxlength 60
  end

  if count $argv >/dev/null
    set files (git rev-parse --show-toplevel)/share/completions/$argv.fish
  else
    set files (git rev-parse --show-toplevel)/share/completions/*.fish
  end

  for f in $files
     set desc_str (string replace -rf "^\s*complete.*-d\s?([\"|'])(.*?)\1\s?.*" '$2' <$f)
     set n 0
     for d in $desc_str
         if test (echo $d | wc -c) -gt $maxlength
             if test $n -lt 1
                 echo $f
                 set n 1
             end
             echo (echo $d | wc -c) chars: $d
         end
     end
     if test $n -gt 0
         echo --------------------------
     end
   end
 end
