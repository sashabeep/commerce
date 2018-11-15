//<?php
/**
 * CurrencySelect
 * 
 * Shows currency select
 *
 * @category    snippet
 * @version     0.1.0
 * @author      mnoskov
 * @internal    @modx_category Commerce
 * @internal    @installset base
*/

if (!empty($modx->commerce)) {
    $tpl = ci()->tpl;

    $params = array_merge([
        'templatePath'      => 'assets/plugins/commerce/templates/front/',
        'templateExtension' => 'tpl',
        'tpl'               => '@FILE:currency_select_row',
        'activeTpl'         => '@FILE:currency_select_active_row',
        'outerTpl'          => '@FILE:currency_select_wrap',
    ], $params);

    $currency = ci()->currency;
    $rows     = $currency->getCurrencies();
    $active   = $currency->getCurrencyCode();

    $out = '';

    $tpl->setTemplatePath($params['templatePath']);
    $tpl->setTemplateExtension($params['templateExtension']);

    foreach ($rows as $row) {
        $chunk = $row['code'] == $active ? $params['activeTpl'] : $params['tpl'];
        $out  .= $tpl->parseChunk($chunk, $row);
    }

    return $tpl->parseChunk($params['outerTpl'], ['wrap' => $out]);
}
