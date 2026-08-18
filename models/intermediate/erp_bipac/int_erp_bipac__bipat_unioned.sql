with bidbfa050 as (

    select
        ATACCT,
        ATCNT1,
        ATCNT2,
        ATCNT3,
        ATCOMP,
        ATDAT1,
        ATDAT2,
        ATDAT3,
        ATDUNS,
        ATEMPH,
        ATEMPT,
        ATFLG1,
        ATFLG2,
        ATFLG3,
        ATLATI,
        ATLONG,
        ATPARC,
        ATSIC,
        ATSIC1,
        ATSIC2,
        ATSIC3,
        ATSIC4,
        ATSIC5,
        ATSITE,
        ATSLS,
        ATTXT1,
        ATTXT2,
        ATTXT3,
        ATUDAT,
        ATUSER,
        ATUTIM,
        "_fivetran_id",
        "_fivetran_synced",
        source_schema
    from {{ ref('stg_erp_bipac__bidbfa050__bipat') }}

),

bidbfe902 as (

    select
        ATACCT,
        ATCNT1,
        ATCNT2,
        ATCNT3,
        ATCOMP,
        ATDAT1,
        ATDAT2,
        ATDAT3,
        ATDUNS,
        ATEMPH,
        ATEMPT,
        ATFLG1,
        ATFLG2,
        ATFLG3,
        ATLATI,
        ATLONG,
        ATPARC,
        ATSIC,
        ATSIC1,
        ATSIC2,
        ATSIC3,
        ATSIC4,
        ATSIC5,
        ATSITE,
        ATSLS,
        ATTXT1,
        ATTXT2,
        ATTXT3,
        ATUDAT,
        ATUSER,
        ATUTIM,
        "_fivetran_id",
        "_fivetran_synced",
        source_schema
    from {{ ref('stg_erp_bipac__bidbfe902__bipat') }}

),

bidbfw753 as (

    select
        ATACCT,
        ATCNT1,
        ATCNT2,
        ATCNT3,
        ATCOMP,
        ATDAT1,
        ATDAT2,
        ATDAT3,
        ATDUNS,
        ATEMPH,
        ATEMPT,
        ATFLG1,
        ATFLG2,
        ATFLG3,
        ATLATI,
        ATLONG,
        ATPARC,
        ATSIC,
        ATSIC1,
        ATSIC2,
        ATSIC3,
        ATSIC4,
        ATSIC5,
        ATSITE,
        ATSLS,
        ATTXT1,
        ATTXT2,
        ATTXT3,
        ATUDAT,
        ATUSER,
        ATUTIM,
        "_fivetran_id",
        "_fivetran_synced",
        source_schema
    from {{ ref('stg_erp_bipac__bidbfw753__bipat') }}

),

unioned as (

    select * from bidbfa050
    union all
    select * from bidbfe902
    union all
    select * from bidbfw753

)

select * from unioned