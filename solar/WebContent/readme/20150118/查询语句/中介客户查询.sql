select a.id,a.address,a.status,a.monthly_rent,
b.name as city_name,c.name as zone_name,
d.name as landlord_name,d.telephone as landlord_phone,
f.name as rent_name ,f.telephone as rent_phone
from rent_room a 
left join common_city b on a.city=b.id 
left join common_city_zone c on a.region=c.id   
left join rent_users d on a.landlord_id=d.id 
left join rent_rent e on a.id=e.room_id  
left join rent_users f on f.id=e.rent_id  
where a.invite_code='13826531136' limit 0,10;