# login.csh.user - copied to $HOME/login.csh
#
# Creation: 17-Jun-98 JDU
# Modified: 28-Nov-2005 RPR DE2005080059P.1 - added this file 
# Revision: 58db6d444da1440ae1bb0a46ab437373
#
# just sources $VULCAN/etc/tcsh_login.csh so that user doesn't have to modify that
# file.

# LOGINVERSION 1  // Do not remove this line
# LOGIN2VERSION 1 // Do not remove this line

if ( $?VULCAN ) then
   source $VULCAN/etc/tcsh_login.csh
endif
