$ ->
  $("input:radio").change(->
    if $(this).prop("checked", true)
      price = "<b>#{$(this).data('price')}</b>"
      dimensions = "<b>#{$(this).data('dimensions')}</b>"
      $("#product_details").html("#{price}<br/>#{dimensions}")
  )

  $("#add_to_cart").click((e)->
    e.preventDefault()

    $input = $("input:radio:checked")
    $label = $("label[for='#{$input.attr("id")}']")
    $form = $('#new_order')
    product_id = $input.val()
    $hidden_input = "<input type='hidden' name='#{$input.attr('name')}' value='#{product_id}' />"

    $form.prepend($hidden_input)

    addCartItems(product_id, $label)

    $.each($form.find("input:hidden"), (index, value) ->
      $(this).attr('name', $(this).attr('name').replace(/\d+/g, index))
    )
  )

  $("[name='sales_channel_filter']").change((e) -> 
    
    key = $(e.target).find('option:selected')
    $target_html = $('#orders_table')
    console.log(key)
    $.ajax "/orders/ajax_filter_orders/#{$(key).val()}",
      error:(jqXHR, textStatus, errorThrown) ->
      success:(data) ->
        console.log(data)
        $target_html.html(data)
  )

addCartItems = (product_id, label) ->
  $duplicateLi = $("[productId='#{product_id}'")
  cost = parseFloat(label.attr("cost"))
  productName = label.attr('productName')

  if $duplicateLi.length > 0
    count = $("input:hidden[value='#{product_id}']").length
    cost = parseFloat(label.attr("cost")) * count
    $duplicateLi.text("(#{count}) #{productName} $#{cost.toFixed(2)} ")
  else
    $("#cart").append("<li productId='#{product_id}' class='list-group-item'>#{productName} #{cost.toFixed(2)}</li>")
    
  