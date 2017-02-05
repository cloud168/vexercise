class vim {
    
    package { "vim": 
        ensure => installed,
    }

    service { "vim":
        ensure => running,
        
        require => package["vim"],
    }
}

class curl  {

    package { "curl":
        ensure => installed,
    }
        
    service { "curl":
        ensure => running,
        
        require => package["curl"],
    }
    
 class curl  {

    package { "git":
        ensure => installed,
    }
        
    service { "git":
        ensure => running,
        
        require => package["git"],
    }
        
  
  
