class vim {
    
    package { "vim": 
        ensure => installed 
    }

    service { "vim":
        ensure => running,
    }
}

class curl  {

    package { "curl":
        ensure => installed
    }
        
    service { "curl":
        ensure => running,
    }
    
 class curl  {

    package { "git":
        ensure => installed
    }
        
    service { "git":
        ensure => running,
    }
        
  
  
