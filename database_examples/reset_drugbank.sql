create extension if not exists rdkit;
drop schema if exists drugbank cascade;
create schema drugbank;
create table drugbank.molecule (
    id serial primary key, -- drugbank id
    rdmol mol, -- molecule instance
    morganfp bfp, -- morgan fingerprint
    ALOGPS_LOGP real,
    ALOGPS_LOGS real,
    ALOGPS_SOLUBILITY text,
    DATABASE_ID text,
    DATABASE_NAME text,
    DRUGBANK_ID text,
    EXACT_MASS real,
    FORMULA text,
    INCHI_IDENTIFIER text,
    INCHI_KEY text,
    JCHEM_ACCEPTOR_COUNT int,
    JCHEM_ATOM_COUNT int,
    JCHEM_AVERAGE_POLARIZABILITY real,
    JCHEM_BIOAVAILABILITY text,
    JCHEM_DONOR_COUNT int,
    JCHEM_FORMAL_CHARGE text,
    JCHEM_GHOSE_FILTER int,
    JCHEM_IUPAC text,
    JCHEM_LOGP real,
    JCHEM_MDDR_LIKE_RULE text,
    JCHEM_NUMBER_OF_RINGS int,
    JCHEM_PHYSIOLOGICAL_CHARGE text,
    JCHEM_PKA real,
    JCHEM_PKA_STRONGEST_ACIDIC real,
    JCHEM_PKA_STRONGEST_BASIC real,
    JCHEM_POLAR_SURFACE_AREA real,
    JCHEM_REFRACTIVITY real,
    JCHEM_ROTATABLE_BOND_COUNT int,
    JCHEM_RULE_OF_FIVE int,
    JCHEM_TRADITIONAL_IUPAC text,
    JCHEM_VEBER_RULE int,
    MOLECULAR_WEIGHT real,
    SMILES text
);

create index fps_morganfp_idx on drugbank.molecule using gist(morganfp);

create table drugbank.name (
    id serial primary key,
    molecule_id int references drugbank.molecule(id) not null, --links to a specific molecule
    name text -- alternative name
);

create table drugbank.product (
    id serial primary key, 
    molecule_id int references drugbank.molecule(id) not null, -- links to a specific molecule
    name text -- the product name
);

grant all on schema drugbank to script;
grant all on all sequences in schema drugbank to script;
grant all on all functions in schema drugbank to script;
grant all on all tables in schema drugbank to script;
alter schema drugbank owner to script;