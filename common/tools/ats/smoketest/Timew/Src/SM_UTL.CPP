// Copyright (c) 1997-2009 Nokia Corporation and/or its subsidiary(-ies).
// All rights reserved.
// This component and the accompanying materials are made available
// under the terms of the License "Symbian Foundation License v1.0"
// which accompanies this distribution, and is available
// at the URL "http://www.symbianfoundation.org/legal/sfl-v10.html".
//
// Initial Contributors:
// Nokia Corporation - initial contribution.
//
// Contributors:
//
// Description:
//

#include "sm_std.h"


GLDEF_C void Panic(TModelPanic aPanic)
//
//	Panic in the engine
//
	{
	User::Panic(_L("TW-ENG-PANIC"),aPanic);
	}

GLDEF_C void Fault(TModelFault aFault)
//
//	Fault in the engine
//
	{
	User::Panic(_L("TW-ENG-FAULT"),aFault);
	}
