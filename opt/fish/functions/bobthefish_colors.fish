# Base16-Monokai
#
# color values from https://github.com/chriskempson/base16-vim/blob/037f328/colors/base16-monokai.vim
# Adapted from https://gist.github.com/GEOFBOT/71a0a4f2afdc662004e580ec3334bdb4

function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'
  __bobthefish_colors base16-dark

# https://github.com/chriskempson/base16
# https://github.com/LalitMaganti/base16-onedark-scheme/blob/master/onedark.yaml
  set -l base00 282C34
  set -l base01 353B45
  set -l base02 3E4451
  set -l base03 545862
  set -l base04 565C64
  set -l base05 ABB2BF
  set -l base06 B6BDCA
  set -l base07 C8CCD4
  set -l base08 E06C75 # red
  set -l base09 D19A66 # orange
  set -l base0A E5C07B # yellow
  set -l base0B 98C379 # green
  set -l base0C 56B6C2 # cyan
  set -l base0D 61AFEF # blue
  set -l base0E C678DD # violet
  set -l base0F BE5046 # brown

  set -l colorfg $base02

  set -x color_initial_segment_exit     $base01 $base08 --bold
  set -x color_initial_segment_private  $base01 $base04 --bold
  set -x color_initial_segment_su       $base01 $base0B --bold
  set -x color_initial_segment_jobs     $base01 $base0D --bold

  set -x color_path                     $base02 $base05
  set -x color_path_basename            $base02 $base06 --bold
  set -x color_path_nowrite             $base02 $base09
  set -x color_path_nowrite_basename    $base02 $base09 --bold

  set -x color_repo                     $base0B $colorfg
  set -x color_repo_work_tree           $base02 $colorfg --bold
  set -x color_repo_dirty               $base08 $base05
  set -x color_repo_staged              $base09 $colorfg

  set -x color_vi_mode_default          $base03 $base05 --bold
  set -x color_vi_mode_insert           $base0B $colorfg --bold
  set -x color_vi_mode_visual           $base09 $colorfg --bold

  set -x color_vagrant                  $base0C $colorfg --bold
  set -x color_k8s                      $base08 $base05 --bold
  set -x color_aws_vault                $base0D $colorfg --bold
  set -x color_aws_vault_expired        $base0D $base08 --bold
  set -x color_username                 $base02 $base0D --bold
  set -x color_hostname                 $base02 $base0D
  set -x color_rvm                      $base08 $base05 --bold
  set -x color_nvm                      $base0B $colorfg --bold
  set -x color_virtualfish              $base0D $colorfg --bold
  set -x color_virtualgo                $base0D $colorfg --bold
  set -x color_desk                     $base0D $colorfg --bold
  set -x color_nix                      $base0D $colorfg --bold
end
