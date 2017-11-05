//
//  SocketImpl.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/10/25.
//  Copyright © 2017年 apple. All rights reserved.
//

import SocketIO

class SocketImpl{
    static let socket = SocketIOClient(socketURL: URL(string: "http://localhost:3001")!)
}
