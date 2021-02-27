alter table TEST_CONSTRAINT_CHECK
    drop constraint CK_SALDO_ALWAYS_ABS;

alter table TEST_CONSTRAINT_CHECK
    add constraint ck_saldo_always_abs check ( SALDO >= 0 )
        deferrable initially deferred;

insert into TEST_CONSTRAINT_CHECK(NIK, NAMA, SALDO, JENIS_KELAMIN)
VALUES ('0202023', 'Test invalid saldo', -1, 'L');

insert into TEST_CONSTRAINT_CHECK(NIK, NAMA, SALDO, JENIS_KELAMIN)
VALUES ('0202022', 'Test Valid saldo', 10000, 'L');


select * from TEST_CONSTRAINT_CHECK where NIK in ('0202023', '0202022');

commit;
