# startup.csh.user - copied to $HOME/startup.csh
# STARTUPVERSION 1  //Do not remove this line
# STARTUP2VERSION 1 //Do not remove this line

if ($VULCAN_VERSION_MAJOR == "9") then
    setenv TCSHONLYSTARTEXES 1
    setenv TCSH_BASE "$VULCAN/bin/cygnus/bin"
    setenv TCSHSUBSTHB "/bin/tcsh ${TCSH_BASE}/tcsh.exe;/bin/csh ${TCSH_BASE}/tcsh.exe;/bin/sh ${TCSH_BASE}/tcsh.exe"
endif

set autolist
set listlinks
set pushdtohome
set visiblebell
set ellipsis
set rmstar
set cdpath= ( ~ )
set notify
set filec
set history=(1000) 
set savehist=(200 merge)
set fignore=(.obj .o .pdb .bsc .ilk .idb  .OBJ .PDB .BSC .ILK .IDB)
set prompt='%/\>'
set savedirs=100
if ($VULCAN_VERSION_MAJOR == "9") then
    set NTlamepathfix
    set NTlameargfix
endif

bindkey -b M-g list-glob
bindkey -b M-* expand-glob
bindkey -b M-v expand-variables
bindkey -b M-w normalize-command
bindkey -b M-/ which-command
bindkey -b M-r i-search-back
bindkey -b M-s i-search-fwd
if ($VULCAN_VERSION_MAJOR == "9") then
    bindkey -b ^W backward-delete-word
    bindkey -b ^U backward-kill-line
    bindkey -b ^I complete-word-fwd
    bindkey -b M-C-ins e_paste_from_clipboard
    bindkey -b N-right forward-char
    bindkey -b N-left backward-char
    bindkey -b N-del delete-char
    bindkey -b N-ins overwrite-mode
    bindkey -b N-1 which-command
    bindkey -b N-2 expand-history
    bindkey -b N-3 complete-word-raw
    bindkey -b N-home beginning-of-line
    bindkey -b N-end end-of-line
    bindkey -b N-up up-history
    bindkey -b N-down down-history
else
    bindkey ^W backward-delete-word
    bindkey ^U backward-kill-line
    bindkey ^I complete-word-fwd
    if ( $?TERM ) then
        bindkey "^[[1~" beginning-of-line     # Home
        bindkey "^[[2~" overwrite-mode        # Insert
        bindkey "^[[3~" delete-char           # Delete
        bindkey "^[[4~" end-of-line           # End
        if ( $TERM =~ "xterm*" ) then
            bindkey "^[OP" which-command      # F1
            bindkey "^[OQ" expand-history     # F2
            bindkey "^[OR" complete-word-raw  # F3
        else
            bindkey "^[[[A" which-command     # F1
            bindkey "^[[[B" expand-history    # F2
            bindkey "^[[[C" complete-word-raw # F3
        endif
    endif
endif

complete cd p/1/d/
complete csh 'p/*/f:*.csh/'
complete perl 'p/*/f:*.{pl,PL,lava,LAVA,clava,CLAVA}/'

if ( $?VULCAN ) then
   source $VULCAN/etc/tcsh_startup.csh
endif
