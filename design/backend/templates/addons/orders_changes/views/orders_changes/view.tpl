{$order_status_descr = $smarty.const.STATUSES_ORDER|fn_get_simple_statuses:true:true}
{$title=__("orders_changes")}

{capture name="mainbox"}

{if $orders_changes}   

<table width="100%" class="table table-middle table--relative table-responsive table-manage-orders">
    <thead data-ca-bulkedit-default-object="true" data-ca-bulkedit-component="defaultObject">
        <tr>            
            <th width="18%">
             ID 
            </th>
            <th width="18%">
             {__("orders_changes_old_status")}
            </th>
            <th width="18%">
             {__("orders_changes_new_status")}
            </th>
            <th width="18%">
             {__("orders_changes_changed_by")}
            </th>
            <th width="18%">
             {__("orders_changes_date_of_change")}
            </th>            
        </tr>
    </thead>

{foreach from=$orders_changes item="o"}

    <tr >        
        <td width="18%"><a href="{"orders.details?order_id=`$o.order_id`"|fn_url}" class="underlined">{__("order")} <bdi>#{$o.order_id}
                    </bdi></td>
        <td width="18%">
        {if $o.status_from}
        {$order_status_descr[$o.status_from]}    
        {else} {__("orders_changes_new_order")}
        {/if}
        
        </td>
        <td width="18%">{$order_status_descr[$o.status_to]}</td>
        <td width="18%"> 
            {if $o.user_id}<a href="{"profiles.update?user_id=`$o.user_id`"|fn_url}">
            {/if}
            {if $o.user_name} {$o.user_name} {else} {__("user")} {/if}
            {if $o.user_id}</a>{/if}
        </td>
        <td width="18%">{$o.timestamp|date_format:"`$settings.Appearance.date_format`, `$settings.Appearance.time_format`"}           
        </td>        
    </tr>

{/foreach}
    
</table>

{else}
    <p class="no-items">{__("no_data")}</p>
{/if}

{/capture}

{include file="common/mainbox.tpl"
    title=$title
    content=$smarty.capture.mainbox   
}