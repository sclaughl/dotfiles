#!/bin/bash
#############################################################################
#
# FILE:         020_misc_functions.sh
#
# DESCRIPTION:  
#
#############################################################################

show_parent_dirs()
{
   pwd | awk '
   BEGIN {
      MAXLEVEL=5;
   }
   {
      levels = gsub(/\//,"/");
      for (i = 1; i <= levels && i <= MAXLEVEL; i++)
      {
         gsub(/\/[^\/]+$/,"");  # delete one level
         (i == levels) && $1="/";
         printf("..%s\t%s\n", (i != 1) ? i : "" , $0);
      }
   }'
}


function_exists()
{
   local a_function_name="$1"

   [[ -z $a_function_name ]] && return 1

   declare -F "$a_function_name" > /dev/null 2>&1

   return $?
}

stripe()
{
   perl -pe '$_ = "\033[1;34m$_\033[0m" if($. % 2)'
}

# vim: ft=bash fdm=marker expandtab ts=3 sw=3 :

