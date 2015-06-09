<?php

/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class Controller extends CController
{
    /**
     *
     * @var array context menu items. This property will be assigned to {@link CMenu::items}.
     */
    public $menu = [];

    /**
     *
     * @var array the breadcrumbs of the current page. The value of this property will
     *      be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
     *      for more details on how to specify this property.
     */
    public $breadcrumbs = array();

    public function init()
    {
        $this->menu = [
            [
                'label' => '控制面板',
                'active' => $this->id == 'site' ? true : false,
                'items' => [
                    [
                        'label' => '工作台',
                        'url' => [
                            'product/new',
                            'tag' => 'new'
                        ]
                    ],
                    [
                        'label' => '车辆监控',
                        'url' => [
                            'product/index',
                            'tag' => 'popular'
                        ]
                    ],
                    [
                        'label' => '投诉处理',
                        'url' => [
                            'product/index',
                            'tag' => 'popular'
                        ]
                    ]
                ]
            ]
        ];
        
        $this->menu[] = [
            'label' => '登出 (' . Yii::app()->user->name . ')',
            'url' => [
                '/site/logout'
            ],
            'visible' => ! Yii::app()->user->isGuest
        ];
    }

    /**
     * 密码加密
     *
     * @param string $password            
     * @return string
     * @author lqf
     */
    public function encryptPasswd($password = DEFAULT_PASSWORD)
    {
        $pass = md5($password);
        $pass = 'suxian' . $pass;
        $pass = md5($pass);
        return $pass;
    }

    /**
     * 获取post参数
     *
     * @param string $param            
     * @author lqf
     */
    public function getParam($param, $default = null)
    {
        return Yii::app()->request->getParam($param, $default);
    }

}