DROP DATABASE IF EXISTS clinic;
CREATE DATABASE clinic;

CREATE TABLE medical_histories(
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id INTEGER,
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices(
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  unit_price decimal,
  quantity integer,
  total_price decimal,
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatment(id)
);

CREATE TABLE treatments(
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type varchar(255),
  name varchar(255),
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);