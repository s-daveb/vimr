// Auto generated for nvim v0.9.0-dev
// See bin/generate_autocmds.py

enum NvimAutoCommandEvent: Int {

  case bufadd = 0
  case bufdelete = 1
  case bufenter = 2
  case buffilepost = 3
  case buffilepre = 4
  case bufhidden = 5
  case bufleave = 6
  case bufmodifiedset = 7
  case bufnew = 8
  case bufnewfile = 9
  case bufreadcmd = 10
  case bufreadpost = 11
  case bufreadpre = 12
  case bufunload = 13
  case bufwinenter = 14
  case bufwinleave = 15
  case bufwipeout = 16
  case bufwritecmd = 17
  case bufwritepost = 18
  case bufwritepre = 19
  case chaninfo = 20
  case chanopen = 21
  case cmdundefined = 22
  case cmdwinenter = 23
  case cmdwinleave = 24
  case cmdlinechanged = 25
  case cmdlineenter = 26
  case cmdlineleave = 27
  case colorscheme = 28
  case colorschemepre = 29
  case completechanged = 30
  case completedone = 31
  case completedonepre = 32
  case cursorhold = 33
  case cursorholdi = 34
  case cursormoved = 35
  case cursormovedi = 36
  case diagnosticchanged = 37
  case diffupdated = 38
  case dirchanged = 39
  case dirchangedpre = 40
  case encodingchanged = 41
  case exitpre = 42
  case fileappendcmd = 43
  case fileappendpost = 44
  case fileappendpre = 45
  case filechangedro = 46
  case filechangedshell = 47
  case filechangedshellpost = 48
  case filereadcmd = 49
  case filereadpost = 50
  case filereadpre = 51
  case filetype = 52
  case filewritecmd = 53
  case filewritepost = 54
  case filewritepre = 55
  case filterreadpost = 56
  case filterreadpre = 57
  case filterwritepost = 58
  case filterwritepre = 59
  case focusgained = 60
  case focuslost = 61
  case funcundefined = 62
  case guienter = 63
  case guifailed = 64
  case insertchange = 65
  case insertcharpre = 66
  case insertenter = 67
  case insertleave = 68
  case insertleavepre = 69
  case lspattach = 70
  case lspdetach = 71
  case menupopup = 72
  case modechanged = 73
  case optionset = 74
  case quickfixcmdpost = 75
  case quickfixcmdpre = 76
  case quitpre = 77
  case recordingenter = 78
  case recordingleave = 79
  case remotereply = 80
  case searchwrapped = 81
  case sessionloadpost = 82
  case shellcmdpost = 83
  case shellfilterpost = 84
  case signal = 85
  case sourcecmd = 86
  case sourcepost = 87
  case sourcepre = 88
  case spellfilemissing = 89
  case stdinreadpost = 90
  case stdinreadpre = 91
  case swapexists = 92
  case syntax = 93
  case tabclosed = 94
  case tabenter = 95
  case tableave = 96
  case tabnew = 97
  case tabnewentered = 98
  case termchanged = 99
  case termclose = 100
  case termenter = 101
  case termleave = 102
  case termopen = 103
  case termresponse = 104
  case textchanged = 105
  case textchangedi = 106
  case textchangedp = 107
  case textchangedt = 108
  case textyankpost = 109
  case uienter = 110
  case uileave = 111
  case user = 112
  case vimenter = 113
  case vimleave = 114
  case vimleavepre = 115
  case vimresized = 116
  case vimresume = 117
  case vimsuspend = 118
  case winclosed = 119
  case winenter = 120
  case winleave = 121
  case winnew = 122
  case winscrolled = 123
}

