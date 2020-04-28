system startup
initialize
    SessionManager default
            register: (ClassSessionHandler forClassNamed: 
         self name)
            inCategory: SessionManager default 
                      userCategory