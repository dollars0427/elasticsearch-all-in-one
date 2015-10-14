elasticsearch-all-in-one Cookbook
=================================
A cookbook for install elasticsearch with kibana and td-agent.

Requirements
------------
Ubuntu 14.04

Attributes
----------
#### elasticsearch-all-in-one::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['kibana']['install_path']</tt></td>
    <td>String</td>
    <td>Where to install Kibana</td>
    <td><tt>"/opt/kibana"</tt></td>
  </tr>
</table>

Usage
-----
#### elasticsearch-all-in-one::default

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[elasticsearch-all-in-one]"
  ]
}
```

License and Authors
-------------------
Authors: Mr.Twister
