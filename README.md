

## End Point ##

```
v1/:category/associations/:band

:category は total, __apname__ / entrance, unice, unit, saloon
:band は 2_4GHZ / 5_0GHz / total
```

## Graph ID ##

```
-> % be ruby example.rb | grep Associations  | grep UNIT
1437: 20150802 [UNIT B1] Entrance Associations
1438: 20150802 [UNIT B1] UNICE Associations
1439: 20150802 [UNIT B2] UNIT Associations
1440: 20150802 [UNIT B3] Saloon Associations
```


```
-> % be ruby example.rb | grep Associations  | grep Total
1197: [Total] 2.4GHz Associations
1198: [Total] 5GHz Associations
1199: [Total] 2.4GHz & 5GHz Associations
```

```
-> % be ruby example.rb | grep Associations  | grep 'ap[0-9][0-9][0-9]'
1170: ap001 Associations
1171: ap002 Associations
1172: ap003 Associations
1173: ap004 Associations
1174: ap005 Associations
1175: ap006 Associations
1176: ap007 Associations
1177: ap008 Associations
1178: ap009 Associations
1179: ap010 Associations
1180: ap011 Associations
1181: ap012 Associations
1182: ap013 Associations
1183: ap014 Associations
1184: ap015 Associations
1185: ap016 Associations
1186: ap101 Associations
1187: ap102 Associations
1188: ap103 Associations
1189: ap104 Associations
1190: ap105 Associations
1191: ap106 Associations
1192: ap107 Associations
1193: ap108 Associations
1194: ap109 Associations
1195: ap110 Associations
1196: ap111 Associations
1202: ap112 Associations
```
