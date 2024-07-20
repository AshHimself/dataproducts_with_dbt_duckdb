
  
    
    

    create  table
      "chinook"."main"."fct_missing_primary_key_tests__dbt_tmp"
  
    as (
      with 

tests as (
    select * from "chinook"."main"."int_model_test_summary" 
    where resource_type in
    (
        'model'
        
    )
),

final as (

    select 
        *
    from tests
    where not(is_primary_key_tested)

)

select * from final



    

    
    

    

    


    );
  
  