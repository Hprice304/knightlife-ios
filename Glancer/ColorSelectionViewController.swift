//
//  ColorSelectionViewController.swift
//  Glancer
//
//  Created by Cassandra Kane on 6/11/16.
//  Copyright © 2016 Vishnu Murale. All rights reserved.
//

import UIKit

class ColorSelectionViewController: UIViewController
{
	var block: BlockID?
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		let id = segue.identifier!
		
		if self.block != nil
		{
			if var meta = UserPrefsManager.instance.getMeta(id: self.block!)
			{
				meta.customColor = id
				UserPrefsManager.instance.setMeta(id: self.block!, meta: meta)
			}
		}
		let tabBar: UITabBarController = segue.destination as! UITabBarController
        tabBar.selectedIndex = 2
	}
}
