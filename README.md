# APlus-nvim
Neovim integration for the A+ learning platform in Aalto Yliopisto

## Dedign Principles
1. Small and fast 
2. Asynchronous in nature, there is no reason why the user can't edit code while the exercise is being sent
3. Clean code for communicating in and out, performant code inside

## Requirements
O1 folder called O1 and has the path '~/IdeaProjects/O1' for compatibilty with IntellijIdea

## Installation
Using [Lazy.nvim](https://github.com/folke/lazy.nvim): 
```lua
{
    'CyanideData2/APlus-nvim'
}
```
Using [VimPlug](https://github.com/folke/lazy.nvim): 
```lua
Plug 'CyanideData2/APlus-nvim'
```
Manual Install

## Design Philosophy
Greatly inspired by [scala plugin aalto](), however, implementing the unix philosophy of "doing one thing great and one thing only", this plugin limits itself to the management of the coursework and does not provide integration with any Scala plugin. This leaves up to the user to implement a LTS server on their own.

## Stolen things
leetcode:
    - main function 
    - logger

## Features to-do
- [ ]  Create prohect structure and configuration
- [ ]  Manage modules (Install, remove and update)
    - [ ] Floating window like Leet Code's change language
- [ ]  Submit assignments
    - [ ]  Set an asynchronous listener for feedback and display notifications bottom bar / notif vim
    - [ ]  Expand feedbacl into a split
- [ ] REPL configuration
- [ ] Compile and run projects

## Optimization
- [ ] Json through saving a file
- [ ] Look for module index through table inversion.
