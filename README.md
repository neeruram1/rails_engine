# Rails Engine

## Description
This project uses Rails and ActiveRecord to build a JSON API which exposes numerous endpoints to the [Rails Driver](https://github.com/neeruram1/rails_driver) which is the front end of this application. 

## Configuration
Run the following commands in your terminal in the order listed below: 

``rake db:create``
``rake db:migrate``
``rake seed_from_csv:all``

## API Endpoints

#### Items

- Single Item
```
/items/:item_id
```
- All Items
```
/items/
```
- Create Item
```
post /item
```
- Update Item
```
patch /item
```
- Destroy Item
```
delete /item
```

#### Merchants

- Single Merchant
```
/merchants/:merchant_id
```
- All Merchants
```
/merchants/
```
- Create Merchant
```
post /merchant
```
- Update Merchant
```
patch /merchant
```
- Destroy Merchant
```
delete /merchant
```

### Relationship Endpoints

#### Items

- View the **merchant** that belongs to the **item** 
```
/items/:item_id/merchant
```

#### Merchants

- View all of the **items** that belong to a single **merchant**
```
/merchants/:merchant_id/items
```

### Find Endpoints

- All find endpoints work for any attribute of the corresponding resource
- They can find partial matches for strings and are case insensitive, for example a request to `GET /api/v1/merchants/find?name=ring` would match a merchant with the name Turing and a merchant with the name Ring World. 

### Items

- Find Item By Query Parameter
```
/items/find?parameter=value
```
- Find Multiple Items by Query Parameter
```
/items/find_all?parameter=value
```
Supported Parameters:
parameter | description | value type/format
-- | -- | --
id | search based on the primary key | integer
name | search based on the name attribute | string 
description | search based on the description attribute | string 
merchant_id | search based on the merchant_id foreign key | integer
unit_price | search based on the unit_price attribute | float with 2 decimal places
created_at | search based on created_at timestamp | YYYY-MM-DD HH:MM:SS
updated_at | search based on updated_at timestamp | YYYY-MM-DD HH:MM:SS

### Merchants

- Find Merchant By Query Parameter
```
/merchants/find?parameter=value
```
- Find Multiple Merchants by Query Parameter
```
/merchants/find_all?parameter=value
```
Supported Parameters:
parameter | description | value type/format
-- | -- | --
id | search based on the primary key | integer
name | search based on the name attribute | string 
created_at | search based on created_at timestamp | YYYY-MM-DD HH:MM:SS
updated_at | search based on updated_at timestamp | YYYY-MM-DD HH:MM:SS

### Business Intelligence Endpoints

- Top `x` Merchants Ranked by Total Revenue
```
/merchants/most_revenue?quantity=x
```
- Total Revenue Generated on Date: start and end = `x` Across All Merchants
```
/merchants/revenue?start=x&end=x
```
- Top `x` Merchants with Most Items Sold
```
/merchants/most_items?quantity=x
```
- Total Revenue for one Merchant
```
/merchants/:merchant_id/revenue
```



