-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Insert 100 hotel bookings
INSERT INTO hotel_bookings (
    id,
    org_id,
    hotel_id,
    city,
    checkin_date,
    checkout_date,
    amount,
    status,
    created_at
)
SELECT
    gen_random_uuid(),
    gen_random_uuid(),
    'HOTEL-' || (floor(random() * 10) + 1)::int,
    (ARRAY['delhi','mumbai','bangalore','hyderabad','pune'])[floor(random()*5+1)],
    CURRENT_DATE + (floor(random()*30))::int,
    CURRENT_DATE + (floor(random()*30)+2)::int,
    ROUND((1000 + random()*9000)::numeric,2),
    (ARRAY['confirmed','cancelled','pending','completed'])[floor(random()*4+1)],
    NOW() - ((random()*30)::int * INTERVAL '1 day')
FROM generate_series(1,100);

INSERT INTO booking_events (
    booking_id,
    event_type,
    payload,
    created_at
)
SELECT
    id,
    'BOOKING_CREATED',
    jsonb_build_object(
        'source', 'seed-script',
        'status', status
    ),
    created_at
FROM hotel_bookings
LIMIT 50;