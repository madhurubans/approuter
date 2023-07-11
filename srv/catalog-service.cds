using {CAPM_madhu.db as db} from '../db/data-model';


service CatalogService @(requires: 'authenticated-user')
// service CatalogService
{
    entity Computers1 as
        projection on db.Computers1;

    entity Customers1 as
        projection on db.Customers1;

    @odata.draft.enabled
    entity Sales1 as
        projection on db.Sales1;

    @readonly
    entity sales_overview1 as
        projection on db.sales_overview1;
}