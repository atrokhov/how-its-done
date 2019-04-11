jQuery ->
  $(document).on 'turbolinks:load', ->
    $('#subcategory_selection').parent().hide()
    subcategories = $('#subcategory_selection').html()
    $('#category_selection').change ->
      category = $('#category_selection :selected').text()
      escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
      options = $(subcategories).filter("optgroup[label=#{escaped_category}]").html()
      if options
        $('#subcategory_selection').html(options)
        $('#subcategory_selection').parent().show()      
      else
        $('#subcategory_selection').empty()
        $('#subcategory_selection').parent().hide()