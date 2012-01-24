class AddStoreIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :store_id, :integer
    execute("update users set store_id = 1")
    execute("update users set store_id = 3 where id in(select user_id from company_extends where company_no = 'U005460')")
    execute("update users set store_id = 2 where id in(select user_id from company_extends where company_no in (
            'U001698','U001731','U001864','U002819','U003368','U003727','U004262','U004366','U004500','U004998',
            'U005056','U005079','U005110','U005131','U005185','U001926','U002039','U002670','U002951','U003112',
            'U003326','U003328','U001461','U001814','U002125','U002126','U002301','U002330','U002357','U002857',
            'U002971','U003378','U003327','U003453','U004096','U004104','U002810','U000348','U001448','U003384',
            'U003451','U003749','U005450','U002091','U000717','U002232','U004281','U004282','U004339','U002814',
            'U002819','U004149','U004639','U005510'))")
    execute("update users set store_id = 2 where id in(select user_id from person_extends where person_no in(
            'P000394','P000456','P000427','P000432','P000446','P000449','P000454','P000461','P000488','P000567',
            'P000491','P000494','P000460','P000525','P000544','P000462','P000565','P000573','P000447','P000458'))")

  end

  def self.down
    remove_column :users, :store_id
  end
end
