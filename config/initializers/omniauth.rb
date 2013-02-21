Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '249774931816868','ae984bb50678a8f2132cda4e65a8cb7b'
  provider :twitter, '4sOviqvHXhvmLXHivZvWKw', '9kluWJlu3V25yAmFvFuxMmSDbt3SNzXhFZUelOoA3VA'
  provider :foursquare, "LG3IJFG04CYNRBMEDWJATSVHMPWV1TQ1JMK3XL3VXASZAMHL", "1W4HABYD1SK14TOY0QLW1ORCMA4ZT0V2DHQGPK2WW4WSUKRT" 
end