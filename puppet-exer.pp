class tzone { 'timezone':
    timezone => 'PHT',
}
include tzone

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
}
    
 class git  {
    package { "git":
        ensure => installed,
    }
        
    service { "git":
        ensure => running,
        require => package["git"],
    }
}
        
class user1 {
    user { 'monitor':
        ensure  => 'present',
        home    => '/home/monitor',
        shell   => '/bin/bash',
    }
}

class directory1 {    
    file { '/home/monitor/scripts/':
        ensure => 'directory',
   }
}
  
class memorychk {  
    exec { 'memory_check':
        command => "/usr/bin/wget -q https://raw.githubusercontent.com/cloud168/vexercise/master/memory_check.sh -O /home/monitor/scripts/memory_check",
        creates => "/home/monitor/scripts/memory_check",
    }

    file { '/home/monitor/scripts/memory_check':
        mode => 0755,
        require => Exec["memory_check"],
    }
}

class directory2 {    
    file { '/home/monitor/src/':
        ensure => 'directory',
   }
   
    file { '/home/monitor/src/my_memory_check':
        ensure => 'link',
        target => '/home/monitor/scripts/memory_check',
        require => File["/home/monitor/src"]
   }
   
    cron { 'my_memory_check':
        command => '/home/monitor/src/my_memory_check',
        user => 'root',
        hour => '*',
        minute => '*/10',
        require => File[ '/home/monitor/src/my_memory_check',
   }
}

 
  
