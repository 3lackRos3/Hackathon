Router.configure
  layoutTemplate: 'layout',
    
Router.map ->
  @route 'welcome', path: '/'

  @route 'speak', path: 'speak'

  @route 'about', path: 'about'
