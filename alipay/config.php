<?php
$config = array (	
		//应用ID,您的APPID。
		'app_id' => "2018122462655641",

		//商户私钥，您的原始格式RSA私钥
		'merchant_private_key' => "
MIIEogIBAAKCAQEAuWbMlaP2Srn2HnIHIHY8ykxfQ8OXQbQGZfHLd7qteJVE2JBz
B1+uN1gs0HZnVZ1tb6kPN/hLAlJIqtQqsj8p9BZpOaZeDDVLt+Vw31XXJ3L/t2x5
mjPi/pjJngkITygyYwKCnNlp9mqmahR8kL4ePFhKkyjxdqoWkVqw8GJ55GxrxJrr
l/9xb8BMyLqbGwNCj2Ie2Ock2z6w7n/vpjMCr2aO4xAESMRSdUx3J4sHLAPslCTt
CG+VICDsU+6jmO5wooebwEbaHqtwaaqIhxYqUnK2qO1A9LW/SzVBHjuz9znKU4nq
kbFyCbeikdP8eu7UCyO+jTaA0oOGoulGRoyJIQIDAQABAoIBAGv+3IcCBjJLFnlv
lIUtOoXgbNGNOitUkTGK4ilw/SEzWfIIWmjeLB4i55/aiKDPXfLf+HRy1kaY5alU
gzZnIqoC7/Jb3Yag+OU66j+9weFB1IDk2ASh2sTQ/QhoXIW3dXpE+Q4iet3GC//Y
xSKPDA+8olwMSnMD6rdqq4yq4DPUki4KEjLJ0yGqzJf9WdC1c80QJVwaWzKJzWYM
gFOJBRGfa5iAyfppuYKddvp+LdRM11fqMJnITmG0rqw+5Y5vubGmnGEzlzVU2gpy
H9IbAKP7mueD4mjP4kbOxEu+CGosK3KHyicFXbFWTyry7CHbLVBVj7rZglpvOTZV
ha3QMtECgYEA3YF/ajMj0zSxH6I3x6tLQzeD4Kv65Oii+5FHlHZqfecPrTw+Qacn
2BsgNIJW40/sVormKX/3J5x6YlUnsPabfbPEJ72zxW+Z3XXAE97mMWs/78GoBbIf
YRwP1xecLBhHyxDX8X6W+TB3kZlGvOz5PpFjewVvHVXZbe2olRL0xdUCgYEA1kX5
1U58lO7VRn5hLT4Bc3r0Pga6RK0UsqLEsHWaeLUhVvB7VKU/dBEEiy1haqNO61nY
496RoK/2jVCuDn0HwRCLyyKYfxg0S4TYC8mjTZYI00L9QA6ROU2vTuBxpcPBY159
ZMYKsCsHiBt0pnc163MDKzETbs6YD1KYrlX5oB0CgYBK5PE+6EGxtPw6lO/FTE6r
UIb/nUa8xUfuRWXtdch1/31WdqsaKbmYITvXZUaZnzlq3ZYK7CCWPRtISkCcXhWe
//xP751sIVrl/V1Pmqs8hGXe3BzCqEJh5Eoa0PnWEvObXnuVRNcpNFEJYsj/MiTo
GeKIAwNZ6OAWgifhF8K5bQKBgCU2pfsr1GsxR40kqc/nsuzRb9XN6U/AF5Ymuq5C
3n8URiQJRAIhaPHJetaJHSAeGLi7M/XvU69qoBFO78vIXy5ip0SyT3XTSFHNUpBJ
hrkU05eNTNpxLTuciFPUmyhE5TNS18hGtNh/wKEc05eNoKmxod1AerWF39bZa3br
q5zpAoGAXNG25abFkg5bESbkSQfXdkyA8MkFe3aWHYfElpnkB5NtOlCKfu6/yVnt
Sjv6Qi3MKN1GCek9d9icqlPZkQby4OUgzyWM1MIva8sE+yXYKszqbmO42DqNWTun
cAwIuLhENUO3uywKLDOeJvhTfgnbkqU4cwTE8oDzJZv2csngdiA=",
		
		//异步通知地址
		'notify_url' => "http://admin.yidianxueche.cn/alipay/notify_url.php",
		
		//同步跳转
		'return_url' => "http://admin.yidianxueche.cn/alipay/return_url.php",

		//编码格式
		'charset' => "UTF-8",

		//签名方式
		'sign_type'=>"RSA2",

		//支付宝网关
		'gatewayUrl' => "https://openapi.alipay.com/gateway.do",

		//支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7yZF9ABCIaoBcID1cVR+BtIaf/ZYVtpOD9gK2M/yfOPuEBaunOt/XiFw92JWBrpT3FpaAA2a3SDzTdu0fYlPa4tDHM62uUKQt6nOO26LW7kH0TWW9S68zx7wYgsxQB32hPEDjbE8N+y89Yg3L3/ybHbbiVRuQuNPr8QZ5Y6sG2w7IujSy/nyMUSs6AUNJTsgFGfPhRXTAVbdKuPdJ69BXhfWmhMglmiScm3B/efSgB1o9ESWe6iJMyhk3ofio9JFqy4x0y0rlSo1lCG534tT90WUvTx4YY+v09WImKZCOolb8dDd6sYGz8JZn0IQzSnwMq/KCPzkH3SHvJypOejdvwIDAQAB",
		
	
);