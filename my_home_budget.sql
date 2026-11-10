-- =========================================================
-- 1. EXPENSE CATEGORIES
-- =========================================================

CREATE TABLE expense_categories (
    category_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

--DROP TABLE IF EXISTS expenses CASCADE;
--DROP TABLE IF EXISTS vendors CASCADE;
--DROP TABLE IF EXISTS expense_categories CASCADE;
--DROP TABLE IF EXISTS expense_subcategories CASCADE;
--DROP TABLE IF EXISTS payment_methods CASCADE;
--DROP TABLE IF EXISTS quarterly_budget CASCADE;
/*
SELECT * FROM expense_subcategories
SELECT * FROM expense_categories
SELECT * FROM family_members
SELECT * FROM payment_methods
SELECT * FROM vendors
SELECT * FROM expenses
SELECT * FROM quarterly_budget
*/
-- =========================================================
-- 2. EXPENSE SUBCATEGORIES
-- =========================================================

CREATE TABLE expense_subcategories (
    subcategory_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id INTEGER NOT NULL,
    subcategory_name VARCHAR(60) NOT NULL,

    FOREIGN KEY (category_id)
        REFERENCES expense_categories(category_id),

    UNIQUE (category_id, subcategory_name)
);


-- =========================================================
-- 3. FAMILY MEMBERS
-- =========================================================

CREATE TABLE family_members (
    member_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_name VARCHAR(60) NOT NULL UNIQUE
);


-- =========================================================
-- 4. PAYMENT METHODS
-- =========================================================

CREATE TABLE payment_methods (
    payment_method_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    payment_method_name VARCHAR(40) NOT NULL UNIQUE
);


-- =========================================================
-- 5. VENDORS
-- =========================================================

CREATE TABLE vendors (
    vendor_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    vendor_name VARCHAR(100) NOT NULL UNIQUE
);


-- =========================================================
-- 6. EXPENSES
-- =========================================================

CREATE TABLE expenses (
    expense_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    expense_date DATE NOT NULL,

    subcategory_id INTEGER NOT NULL,

    member_id INTEGER,

    vendor_id INTEGER,

    payment_method_id INTEGER,

    amount NUMERIC(12,2) NOT NULL,

    is_recurring BOOLEAN DEFAULT FALSE,

    paid_status VARCHAR(10) DEFAULT 'PAID',

    description VARCHAR(255),

    FOREIGN KEY (subcategory_id)
        REFERENCES expense_subcategories(subcategory_id),

    FOREIGN KEY (member_id)
        REFERENCES family_members(member_id),

    FOREIGN KEY (vendor_id)
        REFERENCES vendors(vendor_id),

    FOREIGN KEY (payment_method_id)
        REFERENCES payment_methods(payment_method_id),

    CHECK (amount > 0),

    CHECK (paid_status IN ('PAID', 'PENDING', 'PARTIAL'))
);

CREATE TABLE quarterly_budget (
    budget_id INTEGER PRIMARY KEY,
    category VARCHAR(100),
    june_26_budget NUMERIC(12,2),
    july_26_budget NUMERIC(12,2),
    august_26_budget NUMERIC(12,2),
    q3_total_budget NUMERIC(12,2),
    q3_monthly_avg NUMERIC(12,2),
    sept_26_budget NUMERIC(12,2),
    oct_26_budget NUMERIC(12,2),
    nov_26_budget NUMERIC(12,2),
    q4_total_budget NUMERIC(12,2),
    difference_q4_q3 NUMERIC(12,2),
    status VARCHAR(50)
);

INSERT INTO expense_categories (category_name)
VALUES
('Groceries'),
('Utilities'),
('Bills'),
('Recharge'),
('Medicine'),
('EMI payments'),
('Transportation'),
('Travel'),
('Insurance'),
('Pooja'),
('Education'),
('Food Outside'),
('Personal Care'),
('Water'),
('Gas'),
('Taxes'),
('Class fees'),
('Trip'),
('Plants'),
('Hospital'),
('Plumbing'),
('Wedding'),
('Tuition fee'),
('Online shopping');


INSERT INTO expense_subcategories
(category_id, subcategory_name)

SELECT category_id, 'Personal care'
FROM expense_categories
WHERE category_name = 'Groceries'

UNION ALL
SELECT category_id, 'Kirana'
FROM expense_categories
WHERE category_name = 'Utilities'

UNION ALL
SELECT category_id, 'Creditcard bills'
FROM expense_categories
WHERE category_name = 'Bills'

UNION ALL
SELECT category_id, 'Mobile/Wifi recharge'
FROM expense_categories
WHERE category_name = 'Recharge'

UNION ALL
SELECT category_id, 'TV Recharge'
FROM expense_categories
WHERE category_name = 'Recharge'

UNION ALL
SELECT category_id, 'Medicine'
FROM expense_categories
WHERE category_name = 'Medicine'

UNION ALL
SELECT category_id, 'Medicine Monthly'
FROM expense_categories
WHERE category_name = 'Medicine'

UNION ALL
SELECT category_id, 'EMI/Home loan'
FROM expense_categories
WHERE category_name = 'EMI payments'

UNION ALL
SELECT category_id, 'Personal loan'
FROM expense_categories
WHERE category_name = 'EMI payments'

UNION ALL
SELECT category_id, 'Mutual fund'
FROM expense_categories
WHERE category_name = 'EMI payments'

UNION ALL
SELECT category_id, 'Petrol'
FROM expense_categories
WHERE category_name = 'Transportation'

UNION ALL
SELECT category_id, 'Travelling'
FROM expense_categories
WHERE category_name = 'Travel'

UNION ALL
SELECT category_id, 'Insurance Policy'
FROM expense_categories
WHERE category_name = 'Insurance'

UNION ALL
SELECT category_id, 'Flower to god'
FROM expense_categories
WHERE category_name = 'Pooja'

UNION ALL
SELECT category_id, 'School/College fees'
FROM expense_categories
WHERE category_name = 'Education'

UNION ALL
SELECT category_id, 'Stationary'
FROM expense_categories
WHERE category_name = 'Education'

UNION ALL
SELECT category_id, 'Hotelling'
FROM expense_categories
WHERE category_name = 'Food Outside'

UNION ALL
SELECT category_id, 'Extra'
FROM expense_categories
WHERE category_name = 'Personal Care'

UNION ALL
SELECT category_id, 'Filter water'
FROM expense_categories
WHERE category_name = 'Water'

UNION ALL
SELECT category_id, 'Cylinder'
FROM expense_categories
WHERE category_name = 'Gas'

UNION ALL
SELECT category_id, 'Tax'
FROM expense_categories
WHERE category_name = 'Taxes'

UNION ALL
SELECT category_id, 'AI Class fee'
FROM expense_categories
WHERE category_name = 'Class fees'

UNION ALL
SELECT category_id, 'Ladies Trip'
FROM expense_categories
WHERE category_name = 'Trip'

UNION ALL
SELECT category_id, 'Plants'
FROM expense_categories
WHERE category_name = 'Plants'

UNION ALL
SELECT category_id, 'Fever,Flue'
FROM expense_categories
WHERE category_name = 'Hospital'

UNION ALL
SELECT category_id, 'Tap and gyser repair'
FROM expense_categories
WHERE category_name = 'Plumbing'

UNION ALL
SELECT category_id, 'Wedding'
FROM expense_categories
WHERE category_name = 'Wedding'

UNION ALL
SELECT category_id, 'Personal tuition'
FROM expense_categories
WHERE category_name = 'Tuition fee'

UNION ALL
SELECT category_id, 'TV'
FROM expense_categories
WHERE category_name = 'Online shopping';


INSERT INTO family_members (member_name)
VALUES
('Father'),
('Mother'),
('Daughter'),
('Son'),
('Family members');

INSERT INTO payment_methods (payment_method_name)
VALUES
('UPI'),
('Cash'),
('Credit Card');

INSERT INTO vendors (vendor_name)
VALUES
('Viraj enterprises'),
('Parivar Super shopee'),
('HDFC'),
('Airtel/Jio'),
('Medplus'),
('IDBI'),
('BPCL'),
('Train'),
('Axis'),
('Jio'),
('Sai FulBhandar'),
('KSNES School'),
('Kotak'),
('Konark'),
('Personal'),
('Vikas Aqua'),
('HP'),
('Santoshi stationers'),
('Bank'),
('Naik sir'),
('Chetan toors'),
('Neeraj plans shop'),
('Navjyot Hospital'),
('Salil plumber'),
('Ishwari''s Wedding'),
('Study Zone'),
('Amazon');

INSERT INTO expenses
(
    expense_date,
    subcategory_id,
    member_id,
    vendor_id,
    payment_method_id,
    amount,
    is_recurring,
    paid_status,
    description
)
VALUES

('2026-06-02',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Personal care'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Viraj enterprises'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 2000, TRUE, 'PAID', 'NULL'),

('2026-06-03',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Kirana'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Parivar Super shopee'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 3000, TRUE, 'PAID', 'Houshold groceries'),

('2026-06-05',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Creditcard bills'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='HDFC'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'HDFC Credit Card bills'),

('2026-06-06',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Mobile/Wifi recharge'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Airtel/Jio'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 1000, TRUE, 'PAID', 'Airtel, Jio Mobile recharge'),

('2026-06-08',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Medicine'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Medplus'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'Daily tablets for Father and Mother'),

('2026-06-12',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='EMI/Home loan'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='IDBI'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 25000, TRUE, 'PAID', 'Home loan EMI'),

('2026-06-13',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Petrol'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='BPCL'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'Petrol for vehicles'),

('2026-06-14',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Travelling'),
 (SELECT member_id FROM family_members WHERE member_name='Family members'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Train'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 50000, FALSE, 'PAID', 'Family Toor'),

('2026-06-15',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Insurance Policy'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Axis'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'LIC Policy'),

('2026-06-18',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='TV Recharge'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Jio'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 500, TRUE, 'PAID', 'Jio Fiber'),

('2026-06-19',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Flower to god'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Sai FulBhandar'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='Cash'),
 200, TRUE, 'PAID', 'Flowers for god'),

('2026-06-21',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='School/College fees'),
 (SELECT member_id FROM family_members WHERE member_name='Daughter'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='KSNES School'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'School tuition fees'),

('2026-06-23',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Personal loan'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='HDFC'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 11000, TRUE, 'PAID', 'Other loan HDFC bank'),

('2026-06-24',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Mutual fund'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Kotak'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'Monthly SIP'),

('2026-06-26',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Hotelling'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Konark'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 2000, FALSE, 'PAID', 'Outside dinner'),

('2026-06-26',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Extra'),
 (SELECT member_id FROM family_members WHERE member_name='Family members'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Personal'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'Personal expenses for all members'),

('2026-06-27',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Filter water'),
 (SELECT member_id FROM family_members WHERE member_name='Family members'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Vikas Aqua'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 600, TRUE, 'PAID', 'Drinking water'),

('2026-06-27',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Cylinder'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='HP'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 1000, TRUE, 'PAID', 'House cooking'),

('2026-06-28',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Stationary'),
 (SELECT member_id FROM family_members WHERE member_name='Son'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Santoshi stationers'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 1000, FALSE, 'PAID', 'School accessories'),

('2026-06-30',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Tax'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Bank'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'Government tax');


INSERT INTO expenses
(
    expense_date,
    subcategory_id,
    member_id,
    vendor_id,
    payment_method_id,
    amount,
    is_recurring,
    paid_status,
    description
)
VALUES

('2026-07-04',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Kirana'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Parivar Super shopee'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 3000, TRUE, 'PAID', 'Houshold groceries'),

('2026-07-06',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Creditcard bills'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='HDFC'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'HDFC Credit Card bills'),

('2026-07-08',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Mobile/Wifi recharge'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Airtel/Jio'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 1000, TRUE, 'PAID', 'Airtel, Jio Mobile recharge'),

('2026-07-09',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='AI Class fee'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Naik sir'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 20000, FALSE, 'PAID', 'AI and Data Science class fees'),

('2026-07-10',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Medicine Monthly'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Medplus'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'Daily tablets for Father and Mother'),

('2026-07-12',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='EMI/Home loan'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='IDBI'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 25000, TRUE, 'PAID', 'Home loan EMI'),

('2026-07-13',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Personal care'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Viraj enterprises'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 2000, TRUE, 'PAID', 'Groceries for home'),

('2026-07-14',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Petrol'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='BPCL'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'Petrol for vehicles'),

('2026-07-16',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Insurance Policy'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Axis'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'LIC Policy'),

('2026-07-17',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Ladies Trip'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Chetan toors'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='Cash'),
 3000, FALSE, 'PAID', 'Bhandardara Trip with friends'),

('2026-07-18',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='TV Recharge'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Jio'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 500, TRUE, 'PAID', 'Jio Fiber'),

('2026-07-20',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Flower to god'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Sai FulBhandar'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='Cash'),
 200, TRUE, 'PAID', 'Flowers for god'),

('2026-07-21',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='School/College fees'),
 (SELECT member_id FROM family_members WHERE member_name='Daughter'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='KSNES School'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'School tuition fees'),

('2026-07-22',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Personal loan'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='HDFC'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 11000, TRUE, 'PAID', 'Other loan HDFC bank'),

('2026-07-24',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Mutual fund'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Kotak'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'Monthly SIP'),

('2026-07-25',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Filter water'),
 (SELECT member_id FROM family_members WHERE member_name='Family members'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Vikas Aqua'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 600, TRUE, 'PAID', 'Drinking water'),

('2026-07-26',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Extra'),
 (SELECT member_id FROM family_members WHERE member_name='Family members'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Personal'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'Personal expenses for all members'),

('2026-07-28',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Cylinder'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='HP'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 1000, TRUE, 'PAID', 'House cooking'),

('2026-07-29',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Plants'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Neeraj plans shop'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='Cash'),
 3000, FALSE, 'PAID', 'Purchase plants for plantation'),

('2026-07-30',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Tax'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Bank'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'Government tax'),

('2026-07-31',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Fever,Flue'),
 (SELECT member_id FROM family_members WHERE member_name='Son'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Navjyot Hospital'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='Cash'),
 5000, FALSE, 'PAID', 'Illness of son');

INSERT INTO expenses

(
    expense_date,
    subcategory_id,
    member_id,
    vendor_id,
    payment_method_id,
    amount,
    is_recurring,
    paid_status,
    description
)
VALUES

('2026-08-02',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Kirana'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Parivar Super shopee'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 3000, TRUE, 'PAID', 'Houshold groceries'),

('2026-08-03',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Personal care'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Viraj enterprises'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 2000, TRUE, 'PAID', 'Groceries for home'),

('2026-08-04',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Creditcard bills'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='HDFC'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'HDFC Credit Card bills'),

('2026-08-05',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Mobile/Wifi recharge'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Airtel/Jio'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 1000, TRUE, 'PAID', 'Airtel, Jio Mobile recharge'),

('2026-08-07',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Medicine Monthly'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Medplus'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'Daily tablets for Father and Mother'),

('2026-08-09',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='EMI/Home loan'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='IDBI'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 25000, TRUE, 'PAID', 'Home loan EMI'),

('2026-08-10',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Petrol'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='BPCL'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'Petrol for vehicles'),

('2026-08-12',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Insurance Policy'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Axis'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'LIC Policy'),

('2026-08-14',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='TV Recharge'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Jio'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 500, TRUE, 'PAID', 'Jio Fiber'),

('2026-08-15',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Tap and gyser repair'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Salil plumber'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='Cash'),
 2000, FALSE, 'PAID', 'Repair tap and geyser'),

('2026-08-17',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Flower to god'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Sai FulBhandar'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='Cash'),
 200, TRUE, 'PAID', 'Flowers for god'),

('2026-08-19',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='School/College fees'),
 (SELECT member_id FROM family_members WHERE member_name='Daughter'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='KSNES School'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'School tuition fees'),

('2026-08-20',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Wedding'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Ishwari''s Wedding'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='Cash'),
 5000, FALSE, 'PAID', 'Cash to niece wedding'),

('2026-08-21',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Personal loan'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='HDFC'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 11000, TRUE, 'PAID', 'Other loan HDFC bank'),

('2026-08-22',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Personal tuition'),
 (SELECT member_id FROM family_members WHERE member_name='Daughter'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Study Zone'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, FALSE, 'PAID', 'Daughter tuition fee'),

('2026-08-23',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Mutual fund'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Kotak'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'Monthly SIP'),

('2026-08-25',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Filter water'),
 (SELECT member_id FROM family_members WHERE member_name='Family members'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Vikas Aqua'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 600, TRUE, 'PAID', 'Drinking water'),

('2026-08-26',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Extra'),
 (SELECT member_id FROM family_members WHERE member_name='Family members'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Personal'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 5000, TRUE, 'PAID', 'Personal expenses for all members'),

('2026-08-28',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Cylinder'),
 (SELECT member_id FROM family_members WHERE member_name='Mother'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='HP'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 1000, TRUE, 'PAID', 'House cooking'),

('2026-08-30',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='Tax'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Bank'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='UPI'),
 10000, TRUE, 'PAID', 'Government tax'),

('2026-08-31',
 (SELECT subcategory_id FROM expense_subcategories WHERE subcategory_name='TV'),
 (SELECT member_id FROM family_members WHERE member_name='Father'),
 (SELECT vendor_id FROM vendors WHERE vendor_name='Amazon'),
 (SELECT payment_method_id FROM payment_methods WHERE payment_method_name='Credit Card'),
 60000, FALSE, 'PAID', 'Purchased Television');
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--1. Total expenditure during three months

SELECT SUM(amount) AS total_expenditure
FROM expenses
WHERE expense_date BETWEEN '2026-06-01' AND '2026-08-31';		--Rs. 468900
------------------------------------------------------------------------------------------
--2. Average monthly expenditure
SELECT 
    SUM(amount) / 3 AS average_monthly_expenditure
FROM expenses
WHERE expense_date BETWEEN '2026-06-01' AND '2026-08-31';		--Rs. 156300
-------------------------------------------------------------------------------------------
--3. Average transaction value

SELECT 
    AVG(amount) AS average_transaction_value
FROM expenses
WHERE expense_date BETWEEN '2026-06-01' AND '2026-08-31';		--Rs. 7562.90/Trasaction
-------------------------------------------------------------------------------------------
--4. Highest expense

SELECT 
    MAX(amount) AS highest_expense
FROM expenses
WHERE expense_date BETWEEN '2026-06-01' AND '2026-08-31';		--Rs. 60000
-----------------------------------------------------------------------------------------
--5. Lowest expense

SELECT 
    MIN(amount) AS lowest_expense
FROM expenses
WHERE expense_date BETWEEN '2026-06-01' AND '2026-08-31';		--Rs. 200
----------------------------------------------------------------------------------------
--6. How many transactions occurred?

SELECT 
    COUNT(*) AS total_transactions
FROM expenses
WHERE expense_date BETWEEN '2026-06-01' AND '2026-08-31';		--Rs. 62
----------------------------------------------------------------------------------------
/*
During June to August 2026, the household recorded 62 transactions
with a total expenditure of ₹4,68,900. The average monthly expenditure was ₹1,56,300,
while the average transaction value was ₹7,562.90.The highest single expense was ₹60,000 
and the lowest was ₹200.
*/
-----------------------------------------------------------------------------------------
--1. Which category does each expense belong to?

SELECT
    e.expense_id,
    e.expense_date,
    ec.category_name,
    es.subcategory_name,
    e.amount,
    e.description
FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id
ORDER BY e.expense_date;
-------------------------------------------------------------------------------------------
--2. Which family member is associated with each expense?

SELECT
    e.expense_id,
    e.expense_date,
    fm.member_name,
    e.amount,
    e.description
FROM expenses e
JOIN family_members fm
    ON e.member_id = fm.member_id
ORDER BY e.expense_date;
-------------------------------------------------------------------------------------------
--3. Which vendor received the payment?

SELECT
    e.expense_id,
    e.expense_date,
    v.vendor_name,
    e.amount,
    e.description
FROM expenses e
JOIN vendors v
    ON e.vendor_id = v.vendor_id
ORDER BY e.expense_date;
--------------------------------------------------------------------------------------------
--4. Which payment method was used?

SELECT
    e.expense_id,
    e.expense_date,
    pm.payment_method_name,
    e.amount,
    e.description
FROM expenses e
JOIN payment_methods pm
    ON e.payment_method_id = pm.payment_method_id
ORDER BY e.expense_date;
--------------------------------------------------------------------------------------------
--5. Complete JOIN query
SELECT
    e.expense_id,
    e.expense_date,
    ec.category_name,
    es.subcategory_name,
    fm.member_name,
    v.vendor_name,
    pm.payment_method_name,
    e.amount,
    e.paid_status,
    e.description
FROM expenses e

JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id

JOIN expense_categories ec
    ON es.category_id = ec.category_id

JOIN family_members fm
    ON e.member_id = fm.member_id

JOIN vendors v
    ON e.vendor_id = v.vendor_id

JOIN payment_methods pm
    ON e.payment_method_id = pm.payment_method_id

ORDER BY e.expense_date;
--------------------------------------------------------------------------------------
--6. Major expense categories

SELECT
    ec.category_name,
    SUM(e.amount) AS total_amount_spent
FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id
GROUP BY ec.category_name
ORDER BY total_amount_spent DESC;
----------------------------------------------------------------------------------------
--7. Category-wise expenditure for June–August only
SELECT
    ec.category_name,
    SUM(e.amount) AS total_amount_spent
FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id
WHERE e.expense_date BETWEEN '2026-06-01' AND '2026-08-31'
GROUP BY ec.category_name
ORDER BY total_amount_spent DESC;
-----------------------------------------------------------------------------------------
--8. Category + number of transactions + total spending

SELECT
    ec.category_name,
    COUNT(e.expense_id) AS number_of_transactions,
    SUM(e.amount) AS total_amount_spent
FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id
WHERE e.expense_date BETWEEN '2026-06-01' AND '2026-08-31'
GROUP BY ec.category_name
ORDER BY total_amount_spent DESC;
-------------------------------------------------------------------------------------------
--1. Classify each expense

SELECT
    e.expense_id,
    e.expense_date,
    ec.category_name,
    e.amount,
    CASE
        WHEN e.amount < 500 THEN 'Small'
        WHEN e.amount >= 500 AND e.amount <= 2000 THEN 'Medium'
        WHEN e.amount > 2000 AND e.amount <= 5000 THEN 'High'
        WHEN e.amount > 5000 THEN 'Very High'
    END AS expense_level
FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id
WHERE e.expense_date BETWEEN '2026-06-01' AND '2026-08-31'
ORDER BY e.expense_date;
--------------------------------------------------------------------------------
--2. How many small expenses occurred?
SELECT
    COUNT(*) AS small_expenses
FROM expenses
WHERE expense_date BETWEEN '2026-06-01' AND '2026-08-31'		--3 expenses
  AND amount < 500;
------------------------------------------------------------------------------
--3. How many high-value expenses occurred?

SELECT
    COUNT(*) AS high_value_expenses
FROM expenses
WHERE expense_date BETWEEN '2026-06-01' AND '2026-08-31'
  AND amount > 2000
  AND amount <= 5000;		--20
-------------------------------------------------------------------------------
--4. Which category contains the most Very High expenses?

SELECT
    ec.category_name,
    COUNT(*) AS very_high_expense_count
FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id
WHERE e.expense_date BETWEEN '2026-06-01' AND '2026-08-31'
  AND e.amount > 5000
GROUP BY ec.category_name
ORDER BY very_high_expense_count DESC;
-----------------------------------------------------------------------------
--UNION(removes duplicate rows)

SELECT e.expense_id, e.expense_date, ec.category_name, e.amount
FROM expenses e
JOIN expense_subcategories es ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec ON es.category_id = ec.category_id
WHERE ec.category_name IN
('Groceries','Utilities','Bills','Recharge','Medicine','EMI payments',
 'Transportation','Insurance','Education','Water','Gas','Taxes',
 'Hospital','Plumbing')

UNION

SELECT e.expense_id, e.expense_date, ec.category_name, e.amount
FROM expenses e
JOIN expense_subcategories es ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec ON es.category_id = ec.category_id
WHERE ec.category_name = 'Travel';
--------------------------------------------------------------------------------
--UNION ALL(keeps duplicate rows)

SELECT e.expense_id, e.expense_date, ec.category_name, e.amount
FROM expenses e
JOIN expense_subcategories es ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec ON es.category_id = ec.category_id
WHERE ec.category_name IN
('Groceries','Utilities','Bills','Recharge','Medicine','EMI payments',
 'Transportation','Insurance','Education','Water','Gas','Taxes',
 'Hospital','Plumbing')

UNION ALL

SELECT e.expense_id, e.expense_date, ec.category_name, e.amount
FROM expenses e
JOIN expense_subcategories es ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec ON es.category_id = ec.category_id
WHERE ec.category_name = 'Travel';
----------------------------------------------------------------------------------------
--1. How much was spent in each month?

SELECT
    EXTRACT(YEAR FROM expense_date) AS year,
    EXTRACT(MONTH FROM expense_date) AS month,
    TO_CHAR(expense_date, 'Month') AS month_name,
    SUM(amount) AS total_spent
FROM expenses
GROUP BY
    EXTRACT(YEAR FROM expense_date),
    EXTRACT(MONTH FROM expense_date),
    TO_CHAR(expense_date, 'Month')
ORDER BY year, month;

/*
Output
Year	Month	Month_name	Total_Spent
2026		6	June    	157300.00
2026		7	July    	135300.00
2026		8	August   	176300.00
*/
------------------------------------------------------------------------------------
--2. How many transactions occurred in each month?

SELECT
    EXTRACT(YEAR FROM expense_date) AS year,
    EXTRACT(MONTH FROM expense_date) AS month,
    TO_CHAR(expense_date, 'Month') AS month_name,
    COUNT(*) AS total_transactions
FROM expenses
GROUP BY
    EXTRACT(YEAR FROM expense_date),
    EXTRACT(MONTH FROM expense_date),
    TO_CHAR(expense_date, 'Month')
ORDER BY year, month;

/*
Output
year	month	month_name	total_transaction
2026	6		June    		20
2026	7		July     		21
2026	8		August   		21
*/
-------------------------------------------------------------------------------
--3. Which month had the highest expenditure?

SELECT
    EXTRACT(YEAR FROM expense_date) AS year,
    EXTRACT(MONTH FROM expense_date) AS month,
    TO_CHAR(expense_date, 'Month') AS month_name,
    SUM(amount) AS total_spent
FROM expenses
GROUP BY
    EXTRACT(YEAR FROM expense_date),
    EXTRACT(MONTH FROM expense_date),
    TO_CHAR(expense_date, 'Month')
ORDER BY total_spent DESC
LIMIT 1;

/*
Output
year	month	month_name	total_spent
2026		8	August  	 176300.00
*/
---------------------------------------------------------------------------------
--4. Which month had the lowest expenditure?

SELECT
    EXTRACT(YEAR FROM expense_date) AS year,
    EXTRACT(MONTH FROM expense_date) AS month,
    TO_CHAR(expense_date, 'Month') AS month_name,
    SUM(amount) AS total_spent
FROM expenses
GROUP BY
    EXTRACT(YEAR FROM expense_date),
    EXTRACT(MONTH FROM expense_date),
    TO_CHAR(expense_date, 'Month')
ORDER BY total_spent ASC
LIMIT 1;

/*
Output
year	month	month_name		total_spent
2026		7		July    	135300.00
*/
----------------------------------------------------------------------------------------------
--5. Which expense categories increased from Month 1 to Month 3?

SELECT
    ec.category_name,
    SUM(CASE
        WHEN EXTRACT(MONTH FROM e.expense_date) = 6
        THEN e.amount ELSE 0
    END) AS june_2026,
    
    SUM(CASE
        WHEN EXTRACT(MONTH FROM e.expense_date) = 8
        THEN e.amount ELSE 0
    END) AS august_2026

FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id

GROUP BY ec.category_name

HAVING
    SUM(CASE
        WHEN EXTRACT(MONTH FROM e.expense_date) = 8
        THEN e.amount ELSE 0
    END)
    >
    SUM(CASE
        WHEN EXTRACT(MONTH FROM e.expense_date) = 6
        THEN e.amount ELSE 0
    END)

ORDER BY august_2026 DESC;
--------------------------------------------------------------------------------------
--6. What was the total expenditure during the quarter?

SELECT
    expense_date,
    EXTRACT(YEAR FROM expense_date) AS year,
    EXTRACT(MONTH FROM expense_date) AS month,
    TO_CHAR(expense_date, 'Month') AS month_name,
    EXTRACT(QUARTER FROM expense_date) AS quarter,
    amount
FROM expenses
ORDER BY expense_date;
----------------------------------------------------------------------------------------

---Window Function

SELECT
    ec.category_name,
    SUM(e.amount) AS category_expense,
    SUM(SUM(e.amount)) OVER () AS total_household_expense,
    ROUND(
        SUM(e.amount) * 100.0
        / SUM(SUM(e.amount)) OVER (),
        2
    ) AS contribution_percentage
FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id
GROUP BY ec.category_name
ORDER BY category_expense DESC;
--------------------------------------------------------------------------------------
--2. Rank the family's expenses from highest to lowest

SELECT
    RANK() OVER (ORDER BY amount DESC) AS expense_rank,
    expense_id,
    expense_date,
    amount,
    description
FROM expenses
ORDER BY expense_rank;
------------------------------------------------------------------------
--rank expenses by category
SELECT
    RANK() OVER (ORDER BY SUM(e.amount) DESC) AS category_rank,
    ec.category_name,
    SUM(e.amount) AS total_expense
FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id
GROUP BY ec.category_name
ORDER BY category_rank;
--------------------------------------------------------------------------------
--PARTITION BY

SELECT
    ec.category_name,
    e.expense_id,
    e.expense_date,
    e.amount,
    RANK() OVER (
        PARTITION BY ec.category_name
        ORDER BY e.amount DESC
    ) AS category_rank
FROM expenses e
JOIN expense_subcategories es
    ON e.subcategory_id = es.subcategory_id
JOIN expense_categories ec
    ON es.category_id = ec.category_id
ORDER BY
    ec.category_name,
    category_rank;
----------------------------------------------------------------------------------









 
 ----