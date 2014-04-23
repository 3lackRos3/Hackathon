Router.configure
  layoutTemplate: 'layout',
    
Router.map ->
  @route 'welcome', path: '/'

  @route 'chat', path: 'chat'

  @route 'about', path: 'about'
