select l.location_id     as kode_lokasi,
       l.street_address  as alamat,
       d.department_id   as kode_department,
       d.department_name as nama_department
from locations l
         left join departments d on (l.location_id = d.location_id);


select l.location_id     as kode_lokasi,
       l.street_address  as alamat,
       d.department_id   as kode_department,
       d.department_name as nama_department
from locations l
         right join departments d on (l.location_id = d.location_id);


select l.location_id     as kode_lokasi,
       l.street_address  as alamat,
       d.department_id   as kode_department,
       d.department_name as nama_department
from locations l
         full join departments d on (l.location_id = d.location_id);
