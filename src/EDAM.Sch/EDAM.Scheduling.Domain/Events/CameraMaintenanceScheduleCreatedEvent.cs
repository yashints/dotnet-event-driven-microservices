﻿using EDAM.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EDAM.Scheduling.Domain.Events
{
    public class CameraMaintenanceScheduleCreatedEvent : IDomainEvent
    {
        public string? DomainData { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
    }
}
