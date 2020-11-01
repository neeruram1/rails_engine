# Rails Engine

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [API Endpoints](#api-endpoints)
- [Contact Info](#contact-info)

<!-- Brief Description -->

## Overview

This project uses Rails and ActiveRecord to build a JSON API which exposes numerous endpoints to the [Rails Driver](https://github.com/neeruram1/rails_driver) which is the front end of this application. 

[Original Project Page](https://backend.turing.io/module3/projects/rails_engine/)

[Technical Requirements](https://backend.turing.io/module3/projects/rails_engine/requirements)

## Built With

* Ruby 2.5.3
* Rails 6.0.3
* PostgreSQL
* RSpec for testing

### Wins

Learning how to work with a back end and front end that exist in two separate repositories. Learning how to test json responses. 

## Installation

**Fork this repository:**

https://github.com/neeruram1/rails_engine/

**Clone your forked repository**

`git clone` and the copied URL

**Change into the directory and install the project dependencies**

`cd` into directory and run `bundle install` for dependencies

**Create, migrate and seed your database**
`cd` into directory and run the below commands in the order listed:
- ``rake db:create``
- ``rake db:migrate``
- ``rake seed_from_csv:all``

## API Endpoints

#### Items

**Single Item**
```
/items/:item_id
```
**All Items**
```
/items/
```
**Create Item**
```
post /item
```
**Update Item**
```
patch /item
```
**Destroy Item**
```
delete /item
```

#### Merchants

**Single Merchant**
```
/merchants/:merchant_id
```
**All Merchants**
```
/merchants/
```
**Create Merchant**
```
post /merchant
```
**Update Merchant**
```
patch /merchant
```
**Destroy Merchant**
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

**Find Item By Query Parameter**
```
/items/find?parameter=value
```
**Find Multiple Items by Query Parameter**
```
/items/find_all?parameter=value
```
**Supported Parameters:**
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

**Find Merchant By Query Parameter**
```
/merchants/find?parameter=value
```
**Find Multiple Merchants by Query Parameter**
```
/merchants/find_all?parameter=value
```
**Supported Parameters:**
parameter | description | value type/format
-- | -- | --
id | search based on the primary key | integer
name | search based on the name attribute | string 
created_at | search based on created_at timestamp | YYYY-MM-DD HH:MM:SS
updated_at | search based on updated_at timestamp | YYYY-MM-DD HH:MM:SS

### Business Intelligence Endpoints

**Top `x` Merchants Ranked by Total Revenue**
```
/merchants/most_revenue?quantity=x
```
**Total Revenue Generated on Date: start and end = `x` Across All Merchants**
```
/merchants/revenue?start=x&end=x
```
**Top `x` Merchants with Most Items Sold**
```
/merchants/most_items?quantity=x
```
**Total Revenue for one Merchant**
```
/merchants/:merchant_id/revenue
```

## Contact Info
👤 **Neeru Ram**

- Github: [neeruram1](https://github.com/neeruram1)
- LinkedIn: [Neeru She/Her](https://www.linkedin.com/in/neeru-ram-81a2b867/)

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/neeruram1/rails_engine.svg?style=flat-square
[contributors-url]: https://github.com/neeruram1/rails_engine/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/neeruram1/rails_engine.svg?style=flat-square
[forks-url]: https://github.com/neeruram1/rails_engine/network/members
[stars-shield]: https://img.shields.io/github/stars/neeruram1/rails_engine.svg?style=flat-square
[stars-url]: https://github.com/neeruram1/rails_engine/stargazers
[issues-shield]: https://img.shields.io/github/issues/neeruram1/rails_engine.svg?style=flat-square
[issues-url]: https://github.com/neeruram1/rails_engine/issues
















