#!/bin/sh
# Base16 Randy-Darker - Shell color setup script
# Randy

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="1b/1b/1b" # Base 00 - Black
color01="da/49/39" # Base 08 - Red
color02="51/9f/50" # Base 0B - Green
color03="ff/c6/6d" # Base 0A - Yellow
color04="6d/9c/be" # Base 0D - Blue
color05="d3/81/c3" # Base 0E - Magenta
color06="76/c7/b7" # Base 0C - Cyan
color07="e6/e1/dc" # Base 05 - White
color08="5a/64/7e" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="f9/f7/f3" # Base 07 - Bright White
color16="cc/78/33" # Base 09
color17="bc/94/58" # Base 0F
color18="27/29/35" # Base 01
color19="3a/40/55" # Base 02
color20="d4/cf/c9" # Base 04
color21="f4/f1/ed" # Base 06
color_foreground="e6/e1/dc" # Base 05
color_background="1b/1b/1b" # Base 00
color_cursor="e6/e1/dc" # Base 05

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
  # I don't remember why I put this here but now it breaks it
# elif [[ $- != *i* ]]; then
#   # non-interactive
#   alias printf=/usr/bin/false
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg e6e1dc # forground
  printf $printf_template_custom Ph 1b1b1b # background
  printf $printf_template_custom Pi e6e1dc # bold color
  printf $printf_template_custom Pj 3a4055 # selection color
  printf $printf_template_custom Pk e6e1dc # selected text color
  printf $printf_template_custom Pl e6e1dc # cursor
  printf $printf_template_custom Pm 1b1b1b # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
unset color_cursor
