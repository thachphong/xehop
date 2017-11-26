<?php

namespace Multiple\Models;
use Multiple\Models\DBModel;

class Mcolor extends DBModel
{
    public $m_color_id;
    public $m_color_name;
  
    public function initialize()
    {
        $this->setSource("m_color");
    }
    public function get_all(){
        return Mcolor::find();
    }
}
