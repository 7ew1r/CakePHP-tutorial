# CakePHP-tutorial

## Installation

### Use Vagrant

1. clone repository
2. `cd /path/to/repo`
3. `vagrant plugin install vagrant-vbguest`
4. `vagrant up`
5. `vagrant ssh`
6. `cd workdir`
7. `curl -s https://getcomposer.org/installer | php`
8. `php composer.phar install`
9. `config/app.php`を編集（データベースとの接続）

```config/app.php
'Datasources' => [
        'default' => [
            // ....
            'username' => 'cakephp',
            'password' => 'cakephp',
            'database' => 'cake_cms',
            // ....
        ]
]
```

10. サーバーの起動、動作確認

`bin/cake server -H 192.168.33.10 -p 8080`

[http://192.168.33.10:8080] にアクセスする