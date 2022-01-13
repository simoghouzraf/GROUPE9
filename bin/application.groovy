

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'tp.mbds.com.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'tp.mbds.com.UserRole'
grails.plugin.springsecurity.authority.className = 'tp.mbds.com.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/**',               access: ['permitAll']],
	[pattern: '/error',          access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/assets/**',      access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/**/js/**',       access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/**/css/**',      access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/**/images/**',   access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/**/favicon.ico', access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/saleAd/edit',	 access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/saleAd/create',	 access: ['ROLE_ADMIN','ROLE_MODERATOR, ROLE_USER']],
	[pattern: '/user/edit',	 access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/user/index',	 access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/user/show',	 access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/user/create',	 access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/api/**',	 access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

