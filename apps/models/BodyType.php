<?php

namespace Multiple\Models;
use Multiple\Models\DBModel;

class BodyType extends DBModel
{
    public $m_body_type_id;
    public $m_body_type_name;
  
    public function initialize()
    {
        $this->setSource("m_body_type");
    }
    public function get_all(){
        return BodyType::find();
    }
}
