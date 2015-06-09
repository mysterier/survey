<?php

class AdminController extends Controller
{
    /**
     * Displays the login page
     */
    public function actionLogin()
    {
        $model = new LoginForm();
               
        // collect user input data
        if (isset($_POST['LoginForm'])) {
            $model->attributes = $_POST['LoginForm'];
            // validate user input and redirect to the previous page if valid
            if ($model->validate() && $model->login())
                $this->redirect('/admin');
        }
        // display the login form
        $this->render('login', array(
            'model' => $model
        ));
    }

    /**
     * Logs out the current user and redirect to homepage.
     */
    public function actionLogout()
    {
        Yii::app()->user->logout();
        $this->redirect(Yii::app()->homeUrl);
    }

    public function actionIndex()
    {
        
    }
    
    public function filters()
    {
        return [
            'accessControl'
        ];
    }
    
    public function accessRules()
    {
        return [
            [
                'allow',
                'actions' => [
                    'login'
                ],
                'users' => [
                    '?'
                ]
            ],
            [
                'deny',
                'users' => [
                    '?'
                ],
                'deniedCallback' => function ($rule) {
                    header("location: /admin/login");
                }
            ],
            [
                'deny',
                'actions' => [
                    'login'
                ],
                'users' => [
                    '@'
                ],
                'deniedCallback' => function ($rule) {
                    header("location: /admin");
                }
            ]
            ];
    }

}
