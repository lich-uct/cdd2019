create extension if not exists rdkit;
drop schema if exists drugbank cascade;
create schema drugbank; -- create a new schema in db

create table drugbank.molecule (
    id serial primary key,
    rdmol mol, -- from extension rdkit
    mfp bfp, -- binary fingerprint
    ALOGPS_LOGP float,
    ALOGPS_LOGS float,
    ALOGPS_SOLUBILITY text,
    DATABASE_ID text,
    DATABASE_NAME text,
    DRUGBANK_ID text,
    EXACT_MASS float,
    FORMULA text,
    GENERIC_NAME text,
    INCHI_IDENTIFIER text,
    INCHI_KEY text,
    JCHEM_ACCEPTOR_COUNT int,
    JCHEM_ATOM_COUNT int,
    JCHEM_AVERAGE_POLARIZABILITY float,
    JCHEM_BIOAVAILABILITY text,
    JCHEM_DONOR_COUNT int,
    JCHEM_FORMAL_CHARGE text,
    JCHEM_GHOSE_FILTER text,
    JCHEM_IUPAC text,
    JCHEM_LOGP float,
    JCHEM_MDDR_LIKE_RULE text,
    JCHEM_NUMBER_OF_RINGS int,
    JCHEM_PHYSIOLOGICAL_CHARGE text,
    JCHEM_PKA float,
    JCHEM_PKA_STRONGEST_ACIDIC float,
    JCHEM_PKA_STRONGEST_BASIC float,
    JCHEM_POLAR_SURFACE_AREA float,
    JCHEM_REFRACTIVITY float,
    JCHEM_ROTATABLE_BOND_COUNT int,
    JCHEM_RULE_OF_FIVE int,
    JCHEM_TRADITIONAL_IUPAC text,
    JCHEM_VEBER_RULE text,
    MOLECULAR_WEIGHT float,
    SMILES text
);

