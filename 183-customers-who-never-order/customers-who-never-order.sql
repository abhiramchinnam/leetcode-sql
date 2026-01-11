select c.name as Customers
from Customers c
left join Orders O ON c.id = O.customerID
where O.id is null;