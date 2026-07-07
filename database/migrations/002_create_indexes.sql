-- Index for filtering by city and created_at
CREATE INDEX idx_hotel_bookings_city_created_at
ON hotel_bookings (city, created_at);

-- Index for grouping by organization and status
CREATE INDEX idx_hotel_bookings_org_status
ON hotel_bookings (org_id, status);

-- Index for booking_events lookup
CREATE INDEX idx_booking_events_booking_id
ON booking_events (booking_id);