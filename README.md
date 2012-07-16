简介 Brief Introduction
-------

Taurus是一个完整的开源电子商务系统基于Ruby on Rails实现。

As an open-source Taurus is built with Ruby on Rails as an E-commerece solution.
It aligns with the most popular online shopping processes in China.

The latest version released is v1.5.1 with the following main functions:
- Product management
- Order management
- User management
- CMS with the default website template

Two payment processes are provided in this version:
- by Alipay
- cash against delivery
- The other two shopping processes will be released in the future: bank transfer & monthly statement.

体验站 Demo
-------------

The demo site is:
website - http://taurus.usingnow.com
- personal user: guesta@guest.com password: 123456
- company user: guestc@guest.com passowrd: 123456

admin system - http://taurus.usingnow.com/admin
- user: adminguest@usingnow.com password: 123456

If you have any questions or advice, please contact: 
opensource@usingnow.com



安装 Installation
------------

1. 克隆项目 (Clone the project)

        git clone git://github.com/usingnow/taurus.git taurus
        cd taurus

2. 安装所需Gem (Install the Gem)

        bundle install

3. 创建sandbox (Create the sandbox)

        bundle exec rake sandbox

6. 启动服务 (Start the service)

        cd sandbox
        rails server