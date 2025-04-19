abstract class App_states{}
 class App_init_states extends App_states{}

 class App_bottom_states extends App_states{}


///busniess screen state
class Business_Loading_states extends App_states{}
class Business_sucess_states extends App_states{}
class Business_error_states extends App_states{
 final String err;
 Business_error_states({required this.err});
}


///sports screen state
class SPorts_Loading_states extends App_states{}
class SPorts_sucess_states extends App_states{}
class SPorts_error_states extends App_states{
 final String err;
 SPorts_error_states({required this.err});
}



///science screen state
class Science_Loading_states extends App_states{}
class Science_sucess_states extends App_states{}
class Science_error_states extends App_states{
 final String err;
 Science_error_states({required this.err});
}


class app_theme_state extends App_states{}

///Search screen state
class News_Search_loading_state extends App_states{}
class News_get_Search_sucess_state extends App_states{}
class News_get_Search_error_state extends App_states{

 final String? err;
 News_get_Search_error_state(this.err);


}